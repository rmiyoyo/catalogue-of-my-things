require_relative 'modules/data_loader_module'
require_relative 'modules/data_saver_module'
require_relative 'modules/genre_module'
require_relative 'modules/music_album_module'
require 'json'

class App
  def initialize
    @genres = load_genres
    @musicalbums = load_music_albums
  end

  include DataLoaderModule
  include DataSaverModule
  include GenreModule
  include MusicAlbumModule
end
