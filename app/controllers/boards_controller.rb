class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy, :sort]

  def index
    @boards = Board.all
  end

  def show
    # render json: @board
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'ボードを作成しました' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json:@board.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'ボードを更新しました' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json:@board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'ボードを削除しました' }
      format.json { head :no_content }
    end
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
    params.require(:board).permit(:name, :about, :deadline)
  end
end
