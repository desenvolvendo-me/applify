module Manager
  class CompaniesController < InternalController
    before_action :set_company, only: %i[show edit update destroy]
    def index
      @q = Company.ransack(params[:q])
      @companies = @q.result(distinct: true)
      @companies = @companies.order('created_at').page(params[:page]).per(4)
      @stacks = Stack.all
    end

    def show; end

    def new
      @company = Company.new
    end

    def create
      @company = Company.create(company_params)
      if @company.save
        redirect_to manager_company_path(@company),
                    notice: I18n.t('controller.manager.companies.create')
      else
        render :new
      end
    end

    def edit; end

    def update
      if @company.update(company_params)
        redirect_to manager_company_path,
                    notice: I18n.t('controller.manager.companies.update')
      else
        render :edit
      end
    end

    def destroy
      @company.destroy
      redirect_to manager_companies_path,
                  notice: I18n.t('controller.manager.companies.destroy')
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
