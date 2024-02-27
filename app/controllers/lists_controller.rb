class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
  @list = List.all
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy

    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
  @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
