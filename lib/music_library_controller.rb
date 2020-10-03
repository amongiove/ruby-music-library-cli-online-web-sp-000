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
      Artist.all.sort_by {|artist| artist.name}.uniq.each_with_index do |artist, index|
        puts "#{index + 1}" + ". " + artist.name
      end
    end

    def list_genres
      Genre.all.sort_by {|genre| genre.name}.uniq.each_with_index do |genre, index|
        puts "#{index + 1}" + ". " + genre.name
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      user_artist = gets.strip
      if Artist.all.detect{|artist| artist.name == user_artist}
        artist = Artist.all.detect{|artist| artist.name == user_artist}
        artist.songs.sort_by {|song| song.name}.uniq.each_with_index do |song, index|
          puts "#{index + 1}" + ". " + song.name + " - " + song.genre.name
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      user_genre = gets.strip
    end

    def play_song
      puts "Which song number would you like to play?"
    end


end
