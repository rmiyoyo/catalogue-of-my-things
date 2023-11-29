require_relative 'Classes/item'
require_relative 'app'

def main
  app = App.new
  app.create_a_genre
  app.save_genres
  app.create_a_music_album
  app.save_albums
  app.list_all_genres
  app.list_all_music_albums
end

main
