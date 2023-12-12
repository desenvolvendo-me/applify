class JobSimulationsController < InternalController
  before_action :set_job_simulation, only: :show

  def index
    @q = JobSimulation.ransack(params[:q])
    @job_simulations = @q.result(distinct: true)
    @job_simulations = @job_simulations.order('created_at')
                                       .page(params[:page])
                                       .per(4)
  end

  def show; end

  private

  def set_job_simulation
    @job_simulation = JobSimulation.find(params[:id])
  end
end
