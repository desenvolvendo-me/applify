ActiveAdmin.register InterviewTest do
  menu parent: I18n.t('active_admin.menu.interview')
  permit_params :company, interview_questions_attributes: %i[id description _destroy]

  index do
    id_column
    column :company
    column I18n.t('active_admin.interview_test.attributes.questions_quantity') do |interview_test|
      interview_test.interview_questions.count
    end
    actions
  end

  show do
    attributes_table do
      row :company
    end

    panel I18n.t('activerecord.models.interview_question', count: interview_test.interview_questions.count) do
      table_for interview_test.interview_questions do
        column :description
      end
    end
  end

  form do |f|
    f.inputs I18n.t('activerecord.models.interview_test') do
      f.input :company
    end
    f.inputs I18n.t('active_admin.interview_test.interview_questions') do
      f.object.interview_questions.build unless f.object.interview_questions.any?

      f.has_many :interview_questions, allow_destroy: true, heading: I18n.t('active_admin.interview_test.interview_questions') do |interview_question|
        interview_question.input :description
      end
    end
    f.actions
  end
end
