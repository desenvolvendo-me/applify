class ApplicationController < ActionController::Base
  before_action :check_profile_completion, if: :user_signed_in?

  private

  def check_profile_completion
    redirect_to new_manager_profile_path unless current_user.profile.present?
  end
end
