class CandidaturesController < InheritedResources::Base
  private

  def candidature_params
    params.require(:candidature).permit(:company_name, :situation)
  end
end
