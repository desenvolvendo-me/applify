module Manager
  class InterviewTestsController < InternalController
    before_action :set_interview_test, only: %i[show edit update destroy]

    def index
      @interview_tests = InterviewTest.all
    end

    def show; end

    def new
      @interview_test = InterviewTest.new
      @interview_test.interview_questions.build
    end

    def create
      @interview_test = InterviewTest.new(interview_test_params)

      if @interview_test.save
        redirect_to @interview_test,
                    notice: 'Interview test was successfully created.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @interview_test.update(interview_test_params)
        redirect_to manager_interview_test_path(@interview_test),
                    notice: 'Interview test was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @interview_test.destroy
      redirect_to manager_interview_tests_path,
                  notice: 'Interview test was successfully destroyed.'
    end

    private

    def set_interview_test
      @interview_test = InterviewTest.find(params[:id])
    end

    def interview_test_params
      params.require(:interview_test).permit(:company)
    end
  end
end
