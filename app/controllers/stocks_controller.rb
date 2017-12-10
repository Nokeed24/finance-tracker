class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have searched for an empty string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end #if end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end #respond end
  end #search end
end #class end
