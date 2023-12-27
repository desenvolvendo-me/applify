module ProfilesHelper
  def profile_title
    case action_name
    when 'edit'
      t('views.manager.profile.edit_view.title')
    when 'complete_registration'
      t('views.manager.profile.complete_registration_view.title')
    end
  end

  def user_profile_image(current_user)
    if current_user.profile.profile_picture.attached?
      image_tag current_user.profile.profile_picture,
                class: 'w-8 h-8 rounded-full'
    else
      content_tag(:svg, nil, class: 'w-8 h-8 rounded-full', fill: '#A0AEC0') do
        content_tag(:rect, nil, width: '100%', height: '100%')
      end
    end
  end
end
