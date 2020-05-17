module Api
  module V1
    class PlaylistsController < ApplicationController
      def index
        if params[:user_id].present?
          @playlists = User.find(params[:user_id]).playlists
        end

        render json: @playlists
      end

      def show
        @playlist = Playlist.find(params[:id])

        render json: @playlist
      end

      def create
        @user = User.find(params[:user_id])
        @user_playlists = @user.playlists.build

        if @user_playlists.save
          render json: @user, status: :created, location: api_v1_user_url(@user)
        else
          render json: @user_playlists.errors, status: :unprocessable_entity
        end
      end
    end
  end
end