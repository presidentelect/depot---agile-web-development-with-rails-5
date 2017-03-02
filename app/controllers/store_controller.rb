class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
 
    session[:counter] = session[:counter] ? session[:counter] + 1 : 1

    @access_count = session[:counter]
    
    if @access_count > 5
      @count_notice = "You have accessed this page #{@access_count} #{'time'.pluralize(@access_count)}."
    end
  end
end
