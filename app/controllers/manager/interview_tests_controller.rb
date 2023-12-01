module Manager
  class InterviewTestsController < InternalController
    before_action :set_interview_test, only: :show

    def index
      @q = InterviewTest.ransack(params[:q])
      @interview_tests = @q.result(distinct: true)
      @interview_tests = @interview_tests.order('created_at').page(params[:page]).per(4)
    end

    def show; end

    private

    def set_interview_test
      @interview_test = InterviewTest.find(params[:id])
    end
  end
end
