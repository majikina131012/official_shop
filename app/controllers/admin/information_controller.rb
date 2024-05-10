class Admin::InformationController < ApplicationController
  before_action :authenticate_admin!

  def index
    @informations = Information.all
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to admin_information_path(@information.id)
    else
      @informations = Information.all
      render :index
    end
  end
  
  def show
    @information = Information.find(params[:id])
  end
  
  def edit
    @information = Information.find(params[:id])
  end
  
  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to admin_information_path(@information.id)
    else
      render :edit
    end
  end
  
  def destroy
    information = Information.find(params[:id])
    information.destroy
    redirect_to admin_information_index_path
  end
  
  private
  
  def information_params
    params.require(:information).permit(:title, :body)
  end

end
