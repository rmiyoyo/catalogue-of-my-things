module DataLoaderModule
  # Created 'json' directory in the project root if missing
  def ensure_data_directory
    data_directory = './json'
    return if Dir.exist?(data_directory)

    Dir.mkdir(data_directory)
  end

  # Fetches data from a JSON file or creates an empty one if not found
  def fetch_data(filename)
    ensure_data_directory
    if File.exist?("./json/#{filename}.json")
      File.read("./json/#{filename}.json")
    else
      File.write("./json/#{filename}.json", JSON.pretty_generate([]))
    end
  end

  # Loads genres from the 'genres.json' file and returns an array of Genre objects
  def load_genres
    genres = JSON.parse(fetch_data('genres'))
    loaded_genres = []
    genres.each do |genre|
      loaded_genres << Genre.new(genre['name'])
    end
    loaded_genres
  end

  # Loads albums from the 'albums.json' file and returns an array of MusicAlbum objects
  def load_music_albums
    albums = JSON.parse(fetch_data('albums'))
    loaded_music_albums = []
    albums.each do |album|
      loaded_music_albums << MusicAlbum.new(album['publish_date'], album['on_spotify'])
    end
    loaded_music_albums
  end
end
