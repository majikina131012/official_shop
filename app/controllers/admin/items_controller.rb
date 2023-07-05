class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new
    @item.save
    redirect_to admin_item_path(@item.id)
  end  
    
  def index
    @items = Item.all
  end  
  
  def show
    @item = Item.find(params[:id])
  end 
end
