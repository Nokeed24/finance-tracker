class UserStocksController < ApplicationController

  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank? #if the stock symbol doesn't exist in the table
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end #if end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to your portfolio"
    redirect_to my_portfolio_path
  end #create end

end #class end
