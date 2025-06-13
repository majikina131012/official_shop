class Public::HomesController < ApplicationController
  
  def top
    @goods = Item.joins(:genre).where(genres: {name: 'GOODS'}).page(params[:page]).per(8)
    @CDs = Item.joins(:genre).where(genres: {name: 'CD'}).page(params[:page]).per(8)
    @informations = Information.page(params[:page]).per(4)
  end
  
  def guide
  end  
  
  
end