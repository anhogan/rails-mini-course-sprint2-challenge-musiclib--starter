class SongSorter
  def initialize(songs)
    @songs = songs
  end

  def sort
    if params[:sort] == "random"
      @sorted_songs = @songs.to_a.shuffle
    elsif params[:sort] == "reverse"
      @sorted_songs = @songs.to_a.reverse
    else
      @sorted_songs = @songs
    end
  end
end