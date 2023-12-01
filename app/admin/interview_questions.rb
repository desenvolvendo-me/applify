ActiveAdmin.register InterviewQuestion do
  menu parent: I18n.t('active_admin.menu.interview')
  permit_params :description

  index do
    id_column
    column :company do |interview_question|
      interview_question.interview_test.company
    end
    column :description
    actions
  end

  show title: proc { |interview_question| "Exibindo #{interview_question.interview_test.company} Question" } do
    attributes_table do
      row :company do |interview_question|
        interview_question.interview_test&.company
      end
      row :description
    end
  end

  form title: proc { |interview_question| "Edit #{interview_question.interview_test.company} Question" } do |f|
    f.inputs do
      f.input :interview_test_id, as: :select, collection: InterviewTest.all.map { |test| [test.company, test.id] }
      f.input :description
    end
    f.actions
  end
end
