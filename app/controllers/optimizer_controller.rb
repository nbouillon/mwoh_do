class OptimizerController < ApplicationController
  def new
  	@card = Card.new
  end

  def test
  	@name = params[:name]
  	@num = params[:num]
  	@align = params[:align][:align2]
  	@num = @num.to_i + 100
  	render 'result'
  end
end
