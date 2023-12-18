ActiveAdmin.register Accord do
  menu parent: I18n.t('active_admin.menu.configuration')
  permit_params :description
end
