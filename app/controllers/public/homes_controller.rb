class Public::HomesController < ApplicationController
  
  def top
    @goods = Item.joins(:genre).where(genres: {name: 'GOODS'})
    @CDs = Item.joins(:genre).where(genres: {name: 'CD'})
    @informations = Information.all
  end
  
  def guide
  end  
  
  
end