module Api
  module V1
    class SongsController < ApplicationController
      def index
        if params[:album_id].present?
          @songs = Album.find(params[:album_id]).songs
        elsif params[:playlist_id].present?
          @songs = Playlist.find(params[:playlist_id]).songs
        else
          @songs = Song.all
        end

        render json: @songs.sort(song_params)
      end

      def show
        @song = Song.find(params[:id])

        render json: @song
      end

      def create
        @playlist = Playlist.find(params[:playlist_id])
        @playlist_song = @playlist.playlist_songs.build(playlist_song_params)

        if @playlist_song.save
          render json: @playlist, status: :created, location: api_v1_playlist_url(@playlist)
        else
          render json: @playlist_song.errors, status: :unprocessable_entity
        end
      end

      private
      def playlist_song_params
        params.require(:song).permit(:song_id)
      end

      def song_params
        params.require(:song).permit(:album_id, :playlist_id)
      end
    end
  end
end
