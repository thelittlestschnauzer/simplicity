class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_url(@list)
    else
      @lists = List.all
      render :index
    end
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  def update
    @list = List.find(params[:id])
    @list.update

    redirect_to lists_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.update(list_params)

    redirect_to lists_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:title,).merge(user_id: current_user.id)
  end
end
