require 'rails_helper'

RSpec.describe Manager::InterviewTestsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @interview_tests' do
      interview_test = create(:interview_test)
      get :index
      expect(assigns(:interview_tests)).to eq([interview_test])
    end

    context 'with search parameters' do
      it 'assigns @interview_tests based on search by company' do
        interview_test_1 = create(:interview_test, company: 'ABC Corp')
        interview_test_2 = create(:interview_test, company: 'XYZ Ltd')
        create(:interview_question, description: 'Technical', interview_test: interview_test_1)
        create(:interview_question, description: 'Behavioral', interview_test: interview_test_2)

        get :index, params: { q: { company_or_interview_questions_description_cont: 'ABC' } }

        expect(assigns(:interview_tests)).to eq([interview_test_1])
      end

      it 'assigns @interview_tests based on search by company' do
        interview_test_1 = create(:interview_test, company: 'ABC Corp')
        interview_test_2 = create(:interview_test, company: 'XYZ Ltd')
        create(:interview_question, description: 'Technical', interview_test: interview_test_1)
        create(:interview_question, description: 'Behavioral', interview_test: interview_test_2)

        get :index, params: { q: { company_or_interview_questions_description_cont: 'behavioral' } }

        expect(assigns(:interview_tests)).to eq([interview_test_2])
      end
    end
  end

  describe 'GET #show' do
    let(:interview_test) { create(:interview_test) }

    it 'returns a successful response' do
      get :show, params: { id: interview_test.id }
      expect(response).to have_http_status(:success)
    end

    it 'assigns @interview_test' do
      get :show, params: { id: interview_test.id }
      expect(assigns(:interview_test)).to eq(interview_test)
    end

  end
end
