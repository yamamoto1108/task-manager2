class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy, :sort]
  protect_from_forgery except: :sort

  def index
    @lists = @board.lists
    @list = List.new
    @list.cards.build
  end

  def show
  end

  def new
    @list = List.new
    @list.cards.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @list = List.create(list_params)
    redirect_to board_lists_path(@board.id)
    # if @list.save
    #   render json: { status: 'success' }
    # else
    #   render json: { status: 'error' }
    # end
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
  end

  def sort
    @list.update(list_params)
    head :ok
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :row_order_position, cards_attributes: [:name, :abput, :deadline]).merge(board_id: params[:board_id])
  end
end
