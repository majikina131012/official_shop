class Public::InformationController < ApplicationController
  def index
    @informations = Information.all
  end
  
  def show
    @information = Information.find(params[:id])
  end
end
