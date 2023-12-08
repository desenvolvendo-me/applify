module Manager
  class CandidaturesController < InternalController
    before_action :set_candidature, only: %i[show edit update destroy]

    def index
      @candidatures = Candidature.all
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
      return if @candidature

      redirect_to manager_candidatures_path
    end

    def candidature_params
      params.require(:candidature).permit(:company_name,
                                          :situation,
                                          :job_position,
                                          :job_description,
                                          :location, :contract_type,
                                          :salary, :benefits, :contact_name,
                                          :contact_phone_number,
                                          :contact_email)
    end
  end
end
