Category.destroy_all 
User.destroy_all
Movie.destroy_all
Review.destroy_all



# movies = RestClient.get('http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&with_genres=27')


c1 = Category.create(name: "Slasher", image: "https://i.pinimg.com/originals/20/13/8a/20138a6ee93bcafca353375daa9d848a.jpg")
c2 = Category.create(name: "Monster", image: "https://a9ofi49mlrn3i0rh13iivxwd-wpengine.netdna-ssl.com/wp-content/uploads/2013/10/Alien_Top10_Monster_List.jpg")
c3 = Category.create(name: "Paranormal", image: "https://newsedgepoint.net/wp-content/uploads/2020/07/21st-Century-Paranormal-Horror-Movies-Wouldnt-Exist-Without-Poltergeist.jpg")
c4 = Category.create(name: "Psychological", image: "https://in.bmscdn.com/content-buzz/2020/06/7horrormoviesthatareactuallypsychologicalthrillers759x597.jpg")
c5 = Category.create(name: "Splatter", image: "http://images.amcnetworks.com/amc.com/wp-content/uploads/2016/03/Dead-alive-1200x707.jpg")
c6 = Category.create(name: "Comedy", image: "https://cms.prod.nypr.digital/images/51889/fill-661x496/")

Array(1).each do |number|
    movies_1 = JSON.parse(HTTParty.get("http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&certification_country=US&with_genres=27&sort_by=revenue.desc").body)
    movies_2 = JSON.parse(HTTParty.get("http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&certification_country=US&with_genres=27&sort_by=revenue.desc&page=2").body)
    movies_3 = JSON.parse(HTTParty.get("http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&certification_country=US&with_genres=27&sort_by=revenue.desc&page=3").body)
    array_of_movies = movies_1["results"] + movies_2["results"] + movies_3["results"] 
    array_of_movies.each do |movie_hash|
        movie_response = HTTParty.get("https://api.themoviedb.org/3/movie/#{movie_hash["id"]}?api_key=a976cdf47901d26f8f48c66e6d59bc99&language=en-US&append_to_response=watch%2Fproviders")
        singular_movie = JSON.parse(movie_response.body)
        if singular_movie["watch/providers"]["results"].count > 0
            watch_providers_list = singular_movie["watch/providers"]["results"]["US"]["rent"]
            watch_providers = watch_providers_list.map {|provider| provider["provider_name"]}
        else 
            watch_providers = []
        end 
        
        if movie_response.code != 404 && singular_movie["poster_path"] && singular_movie["runtime"] 
            Movie.create({
                title: singular_movie["title"],
                poster_url: "https://image.tmdb.org/t/p/w500" + singular_movie["poster_path"].to_s,
                year: singular_movie["release_date"],
                runtime: singular_movie["runtime"].to_s + " minutes",
                summary: singular_movie["overview"], 
                category_id: Category.all.sample.id,
                watch_providers: watch_providers
            })
            puts "seeded #{singular_movie["title"]}"
        end
    end
end

