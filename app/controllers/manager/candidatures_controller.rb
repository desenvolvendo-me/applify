module Manager
  class CandidaturesController < InheritedResources::Base
    def create
      create!(notice: t('controllers.candidatures.create'))
    end

    def update
      update!(notice: t('controllers.candidatures.update'))
    end

    def destroy
      destroy! do |format|
        format.html do
          redirect_to manager_candidatures_path(status: :see_other),
                      notice: "#{resource.company_name} #{t('controllers.candidatures.destroy')}"
        end
      end
    end

    private

    def candidature_params
      params.require(:candidature).permit(:company_name, :situation)
    end
  end
end