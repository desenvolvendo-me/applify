ActiveAdmin.register SimulationQuestion do
  menu parent: I18n.t('active_admin.menu.prep_interview')
  permit_params :job_simulation_id, :description, :answer_check, :answer_text, :answer_link, :answer_type

  index do
    id_column
    column :company do |simulation_question|
      simulation_question.job_simulation.company
    end
    column :description
    actions
  end

  show title: proc { |simulation_question| "#{t('active_admin.simulation_question.show.showing')} #{simulation_question.job_simulation.company}" } do
    attributes_table do
      row :company do |simulation_question|
        simulation_question.job_simulation&.company
      end
      row :description
    end
  end

  form title: proc { |simulation_question| simulation_question.new_record? ? I18n.t('active_admin.simulation_question.form_new') : "#{I18n.t('active_admin.simulation_question.form_edit')} #{simulation_question.job_simulation.company}" } do |f|
    f.inputs do
      f.input :job_simulation, as: :select, collection: JobSimulation.all.map { |test| [test.company, test.id] }
      f.input :description
    end
    f.actions
  end
end
