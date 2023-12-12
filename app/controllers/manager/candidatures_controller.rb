module Manager
  class CandidaturesController < InternalController
    before_action :set_candidature, only: %i[show edit update destroy]

    def index
      @q = Candidature.ransack(params[:q])
      @candidatures = @q.result(distinct: true)
      @candidatures = @candidatures.order('created_at')
                                   .page(params[:page])
                                   .per(4)
    end

    def show; end

    def new
      @candidature = Candidature.new
    end

    def create
      @candidature = Candidature.new(candidature_params)

      if @candidature.save
        redirect_to manager_candidature_path(@candidature),
                    notice: t('controllers.candidatures.create')
      else
        render :new
      end
    end

    def edit; end

    def update
      if @candidature.update(candidature_params)
        redirect_to manager_candidature_path(@candidature),
                    notice: t('controllers.candidatures.update')
      else
        render :edit
      end
    end

    def destroy
      return unless @candidature.destroy

      redirect_to manager_candidatures_path,
                  notice: "#{@candidature.company_name}
                            #{t('controllers.candidatures.destroy')}",
                  status: :see_other
    end

    private

    def set_candidature
      @candidature = Candidature.find_by(id: params[:id])
    end

    def candidature_params
      params.require(:candidature).permit(:company_name,
                                          :situation,
                                          :job_position,
                                          :job_description,
                                          :personal_projects,
                                          :frame_work,
                                          :programming_language,
                                          :application_date,
                                          :presentation_letter,
                                          :knowledge_about_company,
                                          :personal_project)
    end
  end
end
