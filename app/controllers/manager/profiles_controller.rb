module Manager
  class ProfilesController < InternalController
    before_action :set_profile, only: %i[show edit update destroy]

    def index
      @profiles = Profile.all
    end

    def show; end

    def new
      @profile = current_user.profile || current_user.build_profile
    end

    def create
      @profile = current_user.profile ||
                 current_user.build_profile(profile_params)

      if @profile.save
        redirect_to manager_profile_url(@profile),
                    notice: 'Profile was successfully created.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @profile.update(profile_params)
        redirect_to manager_profile_url(@profile),
                    notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @profile.destroy
      redirect_to manager_profiles_url,
                  notice: 'Profile was successfully destroyed.'
    end

    private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :name, :user_type)
    end
  end
end
