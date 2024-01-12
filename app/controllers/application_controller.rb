class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  before_action :check_profile_completion, if: lambda {
    user_signed_in? && !creating_profile?
  }

  before_action :authenticate_user!, if: lambda {
    controller_path.start_with?('manager') && !user_signed_in?
  }

  private

  def check_profile_completion
    return if current_user.profile.present?

    redirect_to new_manager_profile_path
  end

  def creating_profile?
    controller_name == 'profiles' &&
      (action_name == 'new' || action_name == 'create')
  end
end
