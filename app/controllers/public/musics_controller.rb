class Public::MusicsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    @music.customer_id = current_customer.id
    if @music.save
      flash[:notice] = "投稿に成功しました"
      redirect_to music_path(@music.id)
    else
      render :new
    end
  end

  def index
    @musics = Music.all
  end

  def show
    @music = Music.find(params[:id])
  end

  def edit
    @music = Music.find(params[:id])
  end

  def update
    @music = Music.find(params[:id])
    if @music.update(music_params)
      flash[:notice] = "更新に成功しました"
      redirect_to music_path(@music.id)
    else
      render :edit
    end
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to musics_path
  end

  private

  def music_params
    params.require(:music).permit(:title, :body)
  end
  

end
