ActiveAdmin.register Setting do
  menu parent:I18n.t('active_admin.menu.configuration'), label: I18n.t('activerecord.attributes.setting.Accord')
  permit_params :accord
end