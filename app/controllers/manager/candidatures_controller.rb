module Manager
  class CandidaturesController < InternalController
    before_action :authenticate_user!
    before_action :set_candidature, only: %i[show edit update destroy]
    before_action :authorize_user, except: %i[index new create]

    def index
      return unless current_user&.profile

      @q = current_user.profile.candidatures.ransack(params[:q])
      @candidatures = @q.result(distinct: true)
                        .order('created_at')
                        .page(params[:page])
                        .per(4)
    end

    def show; end

    def new
      @candidature = current_user.profile.candidatures.build
    end

    def create
      @candidature = current_user.profile.candidatures.build(candidature_params)

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
      @candidature = current_user.profile.candidatures.find_by(id: params[:id])

      return if @candidature

      flash[:alert] = 'Candidature not found.'
      redirect_to manager_candidatures_path
    end

    def candidature_params
      params.require(:candidature).permit(:company_name,
                                          :situation,
                                          :job_position,
                                          :frame_work,
                                          :programming_language,
                                          :application_date,
                                          :presentation_letter,
                                          :knowledge_about_company,
                                          :personal_project, :profile_id)
    end

    def authorize_user
      nil if current_user && current_user.profile == @candidature.profile
    end
  end
end
