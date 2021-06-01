# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'

movies = RestClient.get('http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&with_genres=27')
variable = "I AM A VARIABLE"
byebug



# Array(1..75).each do |number|
#     movies = JSON.parse(HTTParty.get("://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&with_genrhttpes=27").body)
#     array_of_movies = movies["results"]
#     array_of_movies.each do |movie_hash|
#         movie_response = HTTParty.get("https://api.themoviedb.org/3/movie/#{movie_hash["id"]}?api_key=#a976cdf47901d26f8f48c66e6d59bc99&language=en-US")
#         singular_movie = JSON.parse(movie_response.body)
#         if movie_response.code != 404 && singular_movie["genres"].first && singular_movie["poster_path"] && singular_movie["runtime"] && singular_movie["vote_average"]
#             Movie.create({
#                 name: singular_movie["title"],
#                 img_url: "https://image.tmdb.org/t/p/w500" + singular_movie["poster_path"].to_s,
#                 year: singular_movie["release_date"],
#                 # length: singular_movie["runtime"].to_s + " minutes",
#                 # overview: singular_movie["overview"], 
#                 # rating: singular_movie["vote_average"].to_s,
#                 # likes: rand(1..90),
#                 # genre: Genre.find_or_create_by(description: singular_movie["genres"].first["name"])
#                 category_id: 1,
#                 watch_providers: "netflix"
#             })
#             puts "seeded #{singular_movie["title"]}"
#         end
#     end
# end