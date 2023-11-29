module Manager
  class ProfilesController < InternalController
    before_action :set_profile, only: %i[show edit update destroy]

    def index
      @manager_profiles = Manager::Profile.all
    end

    def show; end

    def new
      @manager_profile = Manager::Profile.new
    end

    def create
      @manager_profile = Manager::Profile.new(profile_params)

      if @manager_profile.save
        redirect_to @manager_profile, notice: 'Profile was successfully created.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @manager_profile.update(profile_params)
        redirect_to @manager_profile, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @manager_profile.destroy
      redirect_to manager_profiles_url, notice: 'Profile was successfully destroyed.'
    end

    private

    def set_profile
      @manager_profile = Manager::Profile.find(params[:id])
    end

    def profile_params
      params.require(:manager_profile).permit(:user_id, :name, :user_type)
    end
  end
end
