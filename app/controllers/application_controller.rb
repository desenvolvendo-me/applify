class ApplicationController < ActionController::Base
  before_action :ensure_profile, if: lambda {
    user_signed_in? && current_user.profile.blank?
  }

  before_action :authenticate_user!, if: lambda {
    controller_path.start_with?('manager') && !user_signed_in?
  }

  private

  def ensure_profile
    success = Profiles::Creator.call(current_user)

    redirect_to edit_manager_profile_path if success
  end
end
