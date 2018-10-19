class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    new_artist = Artist.create(artist_params)
    redirect_to artist_path(new_artist)
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  private
    def artist_params
      params.require(:artist).permit(:name)
    end
end
