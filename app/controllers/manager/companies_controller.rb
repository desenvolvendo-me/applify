module Manager
  class CompaniesController < InternalController
    before_action :set_company, only: %i[show edit update destroy]
    def index
      @manager_companies = Manager::Company.all
    end

    def show; end

    def new
      @manager_company = Manager::Company.new
    end

    def create
      @manager_company = Manager::Company.create(company_params)
      if @manager_company.save
        redirect_to manager_company_url(@manager_company),
                    notice: 'Company successfully created.'
      else
        render :new
      end
    end

    def update
      if @manager_company.update(company_params)
        redirect_to manager_company_url, notice: 'Company successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @manager_company.destroy
      redirect_to manager_companies_path,
                  notice: 'Company successfully destroy.'
    end

    private

    def set_company
      @manager_company = Manager::Company.find(params[:id])
    end

    def company_params
      params.require(:manager_company)
            .permit(:name, :description, :linkedin, :site)
    end
  end
end
