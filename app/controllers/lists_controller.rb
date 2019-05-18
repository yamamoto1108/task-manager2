class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :sort]
  protect_from_forgery except: :sort

  def index
    @board = board.find(params[:board_id])
    @lists = @board.lists
    render json: lists
  end

  def show
    render json: @list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html{ redirect_to @list, notice: 'リストを作成しました' }
        format.json{ render :show, status: :created, location: @list }
      else
        format.html{ render :new }
        format.json{ render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html{ redirect_to @list, notice: 'リストを更新しました' }
        format.json{ render :show, status: :ok, location: @list }
      else
        format.html{ render :edit }
        format.json{ render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html{ redirect_to lists_url, notice: 'リストを削除しました' }
      format.json{ head :no_content }
    end
  end

  def sort
    @list.update(list_params)
    head :ok
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :row_order_position).merge(board_id: params[:board_id])
  end
end
