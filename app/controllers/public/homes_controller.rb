class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all
    @informations = Information.all
  end
  
  def guide
  end  
  
  
end