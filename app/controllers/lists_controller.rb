class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new((list_params))
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprecessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
