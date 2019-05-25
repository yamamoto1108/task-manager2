class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy, :sort]

  def index
    @pboards = Board.where(user_id: current_user.id, team_id: nil)
    @tboards = Board.where(user_id: current_user.id).where.not(team_id: nil)
  end

  def show
    # render json: @board
  end

  def new
    @board = Board.new
    @backgrounds = Background.all
  end

  def create
    @board = Board.create(board_params)
    redirect_to board_lists_path(@board)
  end

  def edit
  end

  def update
    @board = Board.update(board_params)
    redirect_to board_lists_path(@board)
  end

  def destroy
    @board = Board.destroy
    redirect_to :index
  end

  def sort
    list = @board.lists[params[:from].to_i]
    list.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :about, :deadline, :background_id, :team_id).merge(user_id: current_user.id)
  end
end
