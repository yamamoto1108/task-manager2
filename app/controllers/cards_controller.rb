class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy, :sort]
  protect_from_forgery except: :sort

  def index
    @list = List.find(params[:list_id])
    @cards = @list.cards
    render json: cards
  end

  def show
    render json: @card
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'カードを作成しました' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json:@card.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'カードを更新しました' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json:@card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'カードを削除しました' }
      format.json { head :no_content }
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
