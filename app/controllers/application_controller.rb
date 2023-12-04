class ApplicationController < ActionController::Base
  before_action :check_profile_completion, if: lambda {
    user_signed_in? && !creating_profile?
  }

  private

  def check_profile_completion
    redirect_to new_manager_profile_path if current_user.profile.blank?
  end

  def creating_profile?
    controller_name == 'profiles' &&
      (action_name == 'new' || action_name == 'create')
  end
end
