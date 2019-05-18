class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy, :sort]
  protect_from_forgery except: :sort

  def index
    @list = List.find(params[:list_id])
    @cards = @list.cards
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @card.destroy
    end
  end

  def sort
    @card.update(card_params)
    head :ok
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :about, :deadline, :row_order_position).merge(list_id: params[:list_id])
  end
end
