module Manager
  class CompaniesController < InternalController
    before_action :set_company, only: %i[show edit update destroy]
    def index
      @companies = Company.all
    end

    def show; end

    def new
      @company = Company.new
    end

    def create
      @company = Company.create(company_params)
      if @company.save
        redirect_to manager_company_path(@company),
                    notice: 'Company successfully created.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @company.update(company_params)
        redirect_to manager_company_path, notice: 'Company successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @company.destroy
      redirect_to manager_companies_path,
                  notice: 'Company successfully destroy.'
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company)
            .permit(:name, :description, :linkedin, :site, stack_ids: [])
    end
  end
end
