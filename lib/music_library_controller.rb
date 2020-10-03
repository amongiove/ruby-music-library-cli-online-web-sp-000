require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = gets.strip

    until user_input == "exit"
      user_input = gets.strip
    end
  end

    def list_songs

      Song.all.sort_by {|song| song.name}
      # index = 0
      # for song in Song.all.sort
      #   index += 1
      #   puts index.to_s + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
      # end
      # Song.all.each do |song|
      #   puts song
      # end
      # Song.all.sort.each_with_index do |song|
      #   puts "#{index + 1}. #{song}"
      # end
    end

    # def list_artists
    #   Artist.all.sort.each_with_index do |artist|
    #     puts "#{index + 1}. artist.name"
    #   end
    # end
    #
    # def list_genres
    # end
    #
    # def list_songs_by_artist
    # end
    #
    # def list_songs_by_genre
    # end
    #
    # def play_song
    # end


end
