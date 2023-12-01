ActiveAdmin.register InterviewQuestion do
  menu parent: I18n.t('active_admin.menu.interview')
  permit_params :interview_test_id, :description

  index do
    id_column
    column :company do |interview_question|
      interview_question.interview_test.company
    end
    column :description
    actions
  end

  show title: proc { |interview_question| "#{t('active_admin.interview_question.show.showing')} #{interview_question.interview_test.company}" } do
    attributes_table do
      row :company do |interview_question|
        interview_question.interview_test&.company
      end
      row :description
    end
  end

  form title: proc { |interview_question| interview_question.new_record? ? I18n.t('active_admin.interview_question.form_new') : "#{I18n.t('active_admin.interview_question.form_edit')} #{interview_question.interview_test.company}" } do |f|
    f.inputs do
      f.input :interview_test, as: :select, collection: InterviewTest.all.map { |test| [test.company, test.id] }
      f.input :description
    end
    f.actions
  end
end
