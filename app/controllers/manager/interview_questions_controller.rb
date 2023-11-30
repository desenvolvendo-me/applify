module Manager
  class InterviewQuestionsController < InternalController
    before_action :set_interview_test
    before_action :set_interview_question, only: %i[edit update destroy]


    def new
      @interview_question = @interview_test.interview_questions.build
    end

    def create
      @interview_question = @interview_test.interview_questions.build(interview_question_params)
      if @interview_question.save
        redirect_to manager_interview_test_path(@interview_test),
                    notice: 'Interview question was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @interview_question.update(interview_question_params)
        redirect_to manager_interview_test_path(@interview_test),
                    notice: 'Interview question was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @interview_question.destroy
      redirect_to manager_interview_test_path(@interview_test),
                  notice: 'Interview question was successfully destroyed.'
    end

    private

    def set_interview_test
      @interview_test = InterviewTest.find(params[:interview_test_id])
    end

    def set_interview_question
      @interview_question = @interview_test.interview_questions.find(params[:id])
    end

    def interview_question_params
      params.require(:interview_question).permit(:description)
    end
  end
end
