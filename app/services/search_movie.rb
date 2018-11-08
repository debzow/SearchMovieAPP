require 'dotenv'
Dotenv.load

class SearchMovie

  def initialize
    Tmdb::Api.key(ENV['THEMOVIEDATABASE_API_KEY'])
  end

  def search(movie)
    final_result = []
    base_url = 
    result = Tmdb::Movie.find(movie)
    i = 0
    20.times do
      hash_movie = Hash.new
      hash_movie['title'] = result[i]::title
      hash_movie['release_date'] = result[i]::release_date
      hash_movie['director'] = get_director(result[i]::id)
      #puts Tmdb::Movie.director(result[i]::id)
      hash_movie['poster_path'] = "https://image.tmdb.org/t/p/w200#{result[i]::poster_path}" 

      final_result << hash_movie
      i = i + 1
    end
    return final_result
  end

  def get_director(movie_id)
    crew = Tmdb::Movie.credits(movie_id)["crew"]
    director = ""
    crew.each do |person|
      if person["job"]=="Director"
        director = person["name"]
      end
    end
    if director == ""
      director = "...not find..."
    end
    return director
  end

end

