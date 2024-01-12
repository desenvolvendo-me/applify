module Manager
  class VersionsController < InternalController
    before_action :set_resource

    def index
      @versions = @resource.versions
    end

    private

    def set_resource
      @resource = params[:resource].classify.constantize.find(params[:id])
    end
  end
end
