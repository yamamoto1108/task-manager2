class CardsController < ApplicationController
  before_action :set_board
  before_action :set_card, only: [:show, :edit, :update, :destroy, :sort]
  protect_from_forgery except: :sort

  def index
    @list = List.find(params[:list_id])
    @cards = @list.cards
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def new
    @card = Card.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @card = Card.create(card_params)
    redirect_to board_lists_path(@board.id)
    # respond_to do |format|
    #   if @card.save
    #     format.html
    #     format.js
    #   else
    #     format.js { render :new }
    #   end
    # end
  end

  def edit
  end

  def update
    @card.update(card_params)
    redirect_to board_lists_path(@board.id)
  end

  def destroy
    @card.destroy
    redirect_to board_lists_path(@board.id)
  end

  def sort
    @card.update(card_params)
    head :ok
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :about, :deadline, :row_order_position, :list_id)
  end
end
