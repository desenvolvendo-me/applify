class JobSimulationsController < InternalController
  before_action :set_job_simulation, only: %i[show edit update]

  def index
    @q = JobSimulation.ransack(params[:q])
    @job_simulations = @q.result(distinct: true)
    @job_simulations = @job_simulations.order('created_at')
                                       .page(params[:page])
                                       .per(4)
  end

  def show; end

  def edit
    @job_simulation.simulation_questions.build
  end

  def update
    if @job_simulation.update(params_permit)
      flash[:notice] = t '.success'
      redirect_to job_simulations_path
    else
      flash[:alert] = t '.failure'
      render :edit
    end
  end


  private

  def set_job_simulation
    @job_simulation = JobSimulation.find(params[:id])
  end

  def params_permit
    params.require(:job_simulation).permit(
      simulation_questions_attributes: %i[id job_simulation_id answer_check
                                          answer_text answer_link answer_file]
    )
  end
end
