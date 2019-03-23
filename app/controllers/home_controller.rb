class HomeController < ApplicationController
  def index
    
    require 'net/http'
    require 'json'
    
    @url    = 'https://api.nomics.com/v1/currencies/interval?key=c96481e6aae21afba764a5e8e3fd6c34&start=2019-03-22T00%3A00%3A00Z&end=2019-03-22T00%3A00%3A05Z'
    @uri    = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins  = JSON.parse(@response)
    
    @mycoins= ['BTC','LTC','XRP','NCASH','XLM',]
    
  end
  
  def about
  end
  
  def lookup
    @currency = params[:Cur]
    
    if @currency                        # if it exists
        @currency = @currency.upcase
    end
    
    if @currency == ''                  # if if is empty
        @currency = 'Het jy vergeet om n currency in te tik?'
    end
    
      @url    = 'https://api.nomics.com/v1/markets/prices?key=c96481e6aae21afba764a5e8e3fd6c34&currency=BTC' #+ @currency
      @uri    = URI(@url)
      @response = Net::HTTP.get(@uri)
      @onecurrency  = JSON.parse(@response)
    
  end
  
end

