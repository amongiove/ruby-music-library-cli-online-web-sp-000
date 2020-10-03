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
      Song.all.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}" + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
      end
    end

    def list_artists
      binding.pry
      Song.all.sort_by {|song| song.artist.name}.each_with_index do |song, index|
        puts "#{index + 1}" + ". " + song.artist.name
      end
    end

    def list_genres
      Song.all.sort_by {|song| song.genre.name}.each_with_index do |song, index|
        puts "#{index + 1}" + ". " + song.genre.name
      end
    end
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
