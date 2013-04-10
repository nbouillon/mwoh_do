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
end
