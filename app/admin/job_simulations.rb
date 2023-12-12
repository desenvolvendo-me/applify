ActiveAdmin.register JobSimulation do
  menu parent: I18n.t('active_admin.menu.prep_interview')
  permit_params :company, simulation_questions_attributes: %i[id description answer_check answer_text answer_link answer_type _destroy]

  index do
    id_column
    column :company
    column I18n.t('active_admin.job_simulation.attributes.questions_quantity') do |job_simulation|
      job_simulation.simulation_questions.count
    end
    actions
  end

  show do
    attributes_table do
      row :company
    end

    panel I18n.t('activerecord.models.simulation_question', count: job_simulation.simulation_questions.count) do
      table_for job_simulation.simulation_questions do
        column :description
        column :answer_type
      end
    end
  end

  form do |f|
    f.inputs I18n.t('activerecord.models.job_simulation') do
      f.input :company
    end
    f.inputs I18n.t('active_admin.job_simulation.simulation_questions') do
      f.object.simulation_questions.build unless f.object.simulation_questions.any?

      f.has_many :simulation_questions, allow_destroy: true, heading: I18n.t('active_admin.job_simulation.simulation_questions') do |simulation_question|
        simulation_question.input :description
        simulation_question.input :answer_type, as: :select
      end
    end
    f.actions
  end
end
