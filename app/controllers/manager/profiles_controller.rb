module Manager
  class ProfilesController < InternalController
    before_action :set_profile, only: %i[show edit update destroy]

    def show; end

    def edit; end

    def update
      if @profile.update(profile_params)
        redirect_to manager_profile_url,
                    notice: t('.success')
      else
        render :edit
      end
    end

    def destroy
      @profile.destroy
      redirect_to manager_home_url,
                  notice: t('.success')
    end

    private

    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(
        :user_id,
        :name,
        :user_type,
        :profile_picture,
        :bio,
        experiences_attributes: %i[id level]
      )
    end
  end
end
