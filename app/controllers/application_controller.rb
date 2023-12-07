class ApplicationController < ActionController::Base
  before_action :check_profile_completion, if: lambda {
    user_signed_in? && !creating_profile?
  }

  private

  def check_profile_completion
    return if current_user.profile.present?

    redirect_to complete_registration_manager_profiles_path
  end

  def creating_profile?
    controller_name == 'profiles' &&
      (action_name == 'complete_registration' || action_name == 'create')
  end
end
