class CardsController < ApplicationController
  def new
  	@card = Card.new
  end

  def show
  	@card = Card.find(params[:id])
  end

  def create
  	@card = Card.new(params[:card])
  	if @card.save
      flash[:success] = "You have Successfully Created a Card!"
  	  redirect_to @card
  	else
  		render 'new'
  	end
  end

  def edit
  	@card = Card.find(params[:id])
    if @card.update_attributes(params[:user])
      flash[:success] = "Card updated"
      redirect_to @card
    else
      render 'edit'
    end
  end

  def index
  	@cards = Card.all
  end

  def destroy
  	Card.find(params[:id]).destroy
    flash[:success] = "Card destroyed."
    redirect_to cards_url
  end

end
