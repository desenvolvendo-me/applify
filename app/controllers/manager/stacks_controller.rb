module Manager
  class StacksController < InternalController
    before_action :set_stack, only: %i[show edit update destroy]

    def index
      @q = Stack.ransack(params[:q])
      @stacks = @q.result(distinct: true)
      @stacks = @stacks.order('created_at')
                       .page(params[:page])
                       .per(4)
    end

    def show; end

    def new
      @stack = Stack.new
    end

    def create
      @stack = Stack.create(stack_params)
      if @stack.save
        redirect_to manager_stack_path(@stack),
                    notice: t('controller.manager.stacks.create')
      else
        render :new
      end
    end

    def edit; end

    def update
      if @stack.update(stack_params)
        redirect_to manager_stack_path,
                    notice: t('controller.manager.stacks.update')
      else
        render :edit
      end
    end

    def destroy
      @stack.destroy
      redirect_to manager_stacks_path,
                  notice: t('controller.manager.stacks.destroy')
    end

    private

    def set_stack
      @stack = Stack.find(params[:id])
    end

    def stack_params
      params.require(:stack).permit(:name)
    end
  end
end
