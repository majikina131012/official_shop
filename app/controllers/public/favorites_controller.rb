class Public::FavoritesController < ApplicationController
  def create
    @music = Music.find(params[:music_id])
    favorite = current_customer.favorites.new(music_id: @music.id)
    favorite.save
  end

  def destroy
    @music = Music.find(params[:music_id])
    favorite = current_customer.favorites.find_by(music_id: @music.id)
    favorite.destroy
  end
end
