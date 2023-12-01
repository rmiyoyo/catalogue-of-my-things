module DataSaverModule
  def save_file(filename, data)
    puts Dir.mkdir('json') unless Dir.exist?('json')
    File.write("json/#{filename}.json", JSON.pretty_generate(data))
  end

  def save_genres
    genres_data = []
    @genres.each do |genre|
      genres_data << { id: genre.id, name: genre.name }
    end
    save_file('genres', genres_data)
  end

  def save_albums
    albums_data = []
    @musicalbums.each do |album|
      albums_data << { publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
    save_file('albums', albums_data)
  end
end
