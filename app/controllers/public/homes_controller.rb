class Public::HomesController < ApplicationController
  
  def top
    @goods = Item.joins(:genre).where(genres: {name: 'GOODS'}).page(params[:goods_page]).per(8)
    @CDs = Item.joins(:genre).where(genres: {name: 'CD'}).page(params[:cds_page]).per(8)
    @informations = Information.page(params[:infromatin_page]).per(4)
  end
  
  def guide
  end  
  
  
end