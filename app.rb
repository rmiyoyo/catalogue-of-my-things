require_relative 'modules/data_loader_module'
require_relative 'modules/data_saver_module'
require_relative 'modules/genre_module'
require_relative 'modules/music_album_module'
require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'classes/item'
require 'json'

class App
  def initialize
    @genres = load_genres
    @musicalbums = load_music_albums
    @games = []
    @authors = []
  end

  def add_game
    puts 'Enter the game author first name: '
    first_name = gets.chomp
    puts 'Enter the game author last name: '
    last_name = gets.chomp
    puts 'Enter the publish date in the format YYYY-MM-DD: '
    publish_date = gets.chomp
    puts 'Is the game multiplayer? (Y/N): '
    multiplayer = gets.chomp
    puts 'Enter the date last played in the format YYYY-MM-DD: '
    date_last_played = gets.chomp

    author = Author.new(first_name, last_name)
    game = Game.new(publish_date, multiplayer, date_last_played)

    @authors.push(author)
    @games.push(game)

    puts 'Game has been added...'
  end

  def list_authors_catalogue
    @authors.each do |author|
      puts "ID: #{author.id} | First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def show_games_catalogue
    @games.each do |game|
      puts "Publish Date: #{game.publish_date}, Multiplayer: #{game.multiplayer}, Date Played: #{game.date_last_played}"
    end
  end

  def save_data
    games = Game.all.map do |game|
      { publish_date: game.publish_date, multiplayer: game.multiplayer, date_last_played: game.date_last_played }
    end
    authors = Author.all.map do |author|
      { first_name: author.first_name, last_name: author.last_name }
    end

    game_json = games.to_json
    author_json = authors.to_json

    directory = 'json/'
    games_file = "#{directory}games.json"
    authors_file = "#{directory}authors.json"

    File.write(games_file, game_json)
    File.write(authors_file, author_json)
  end

  def load_data
    author_directory = 'json/authors.json'
    if File.exist?(author_directory)
      data = JSON.parse(File.read(author_directory))
      @authors = data.map do |author|
        Author.new(author['first_name'], author['last_name'])
      end
    else
      puts 'Data to be loaded unavailable...'
    end

    games_directory = 'json/games.json'
    if File.exist?(games_directory)
      data = JSON.parse(File.read(games_directory))
      @games = data.map do |game|
        Game.new(game['publish_date'], game['multiplayer'], game['date_last_played'])
      end
    else
      puts 'Data to be loaded unavailable...'
    end
  end

  include DataLoaderModule
  include DataSaverModule
  include GenreModule
  include MusicAlbumModule
end
