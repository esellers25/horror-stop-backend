Category.destroy_all 
User.destroy_all
Movie.destroy_all
Review.destroy_all



# movies = RestClient.get('http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&with_genres=27')
c1 = Category.create(name: "Slasher")
c2 = Category.create(name: "Monster")




Array(1).each do |number|
    movies = JSON.parse(HTTParty.get("http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&certification_country=US&with_genres=27&sort_by=revenue.desc").body)
    array_of_movies = movies["results"]
    array_of_movies.each do |movie_hash|
        movie_response = HTTParty.get("https://api.themoviedb.org/3/movie/#{movie_hash["id"]}?api_key=a976cdf47901d26f8f48c66e6d59bc99&language=en-US")
        singular_movie = JSON.parse(movie_response.body)
        if movie_response.code != 404 && singular_movie["poster_path"] && singular_movie["runtime"] 
            Movie.create({
                title: singular_movie["title"],
                poster_url: "https://image.tmdb.org/t/p/w500" + singular_movie["poster_path"].to_s,
                year: singular_movie["release_date"],
                runtime: singular_movie["runtime"].to_s + " minutes",
                summary: singular_movie["overview"], 
                # rating: singular_movie["vote_average"].to_s,
                # likes: rand(1..90),
                # genre: Genre.find_or_create_by(description: singular_movie["genres"].first["name"])
                category_id: Category.first.id,
                watch_providers: "netflix"
            })
            puts "seeded #{singular_movie["title"]}"
        end
    end
end