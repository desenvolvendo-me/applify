module Manager
  class InterviewTestsController < InternalController
    def index
      @interview_tests = InterviewTest.all
    end
  end
end
