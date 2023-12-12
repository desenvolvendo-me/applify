module ProfilesHelper
  def profile_title
    case action_name
    when 'edit'
      t('views.manager.profile.edit_view.title')
    when 'complete_registration'
      t('views.manager.profile.complete_registration_view.title')
    end
  end
end
