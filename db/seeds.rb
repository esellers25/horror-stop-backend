Category.destroy_all 
User.destroy_all
Movie.destroy_all
Review.destroy_all



# movies = RestClient.get('http://api.themoviedb.org/3/discover/movie?api_key=a976cdf47901d26f8f48c66e6d59bc99&with_genres=27')


c1 = Category.create(name: "Slasher", image: "https://i.pinimg.com/originals/20/13/8a/20138a6ee93bcafca353375daa9d848a.jpg")
c2 = Category.create(name: "Monster", image: "https://a9ofi49mlrn3i0rh13iivxwd-wpengine.netdna-ssl.com/wp-content/uploads/2013/10/Alien_Top10_Monster_List.jpg")
c3 = Category.create(name: "Supernatural", image: "https://newsedgepoint.net/wp-content/uploads/2020/07/21st-Century-Paranormal-Horror-Movies-Wouldnt-Exist-Without-Poltergeist.jpg")
c4 = Category.create(name: "Psychological", image: "https://in.bmscdn.com/content-buzz/2020/06/7horrormoviesthatareactuallypsychologicalthrillers759x597.jpg")
c5 = Category.create(name: "Splatter", image: "http://images.amcnetworks.com/amc.com/wp-content/uploads/2016/03/Dead-alive-1200x707.jpg")
c6 = Category.create(name: "Scary But Funny", image: "https://cms.prod.nypr.digital/images/51889/fill-661x496/")
c7 = Category.create(name: "Body Horror", image: "https://www.indiewire.com/wp-content/uploads/2019/10/shutterstock_editorial_5883390c.jpg?w=780")
c8 = Category.create(name: "Devil stuff", image: "https://townsquare.media/site/366/files/2020/08/tenacious-d-tribute-hero.jpg?w=980&q=75")
c9 = Category.create(name: "Dumb Bullshit", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9fM83y7rlsWxb0vjepmu9pwdShJBU6u1Xg&usqp=CAU")
c10 = Category.create(name: "Sci-Fi But Spooky", image: "https://pyxis.nymag.com/v1/imgs/07f/762/6ec01dddd29c0a9d9895b71c20c0bd911d-alien.rsquare.w700.jpg")
c11 = Category.create(name: "Zombie", image: "https://www.syfy.com/sites/syfy/files/styles/1200x680_hero/public/2019/06/ftwd_501_rg_1212_0596_rt.jpg" )

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

m1 = Movie.find_by(title: "The Oak Room" )
m1.update("category_id":4)

m2 = Movie.find_by(title: "Hotel Inferno 3: The Castle of Screams")
m2.update("category_id":9)

m3 = Movie.find_by(title: "Dead Again")
m3.update("category_id":6)

m4 = Movie.find_by(title: "It")
m4.update("category_id":3)

m5 = Movie.find_by(title: "World War Z")
m5.update("category_id":11)

m6 = Movie.find_by(title: "The Meg")
m6.update("category_id":2)

m7 = Movie.find_by(title: "It Chapter Two")
m7.update("category_id":3)

m8 = Movie.find_by(title: "Jaws")
m8.update("category_id":2)

m9 = Movie.find_by(title: "The Exorcist")
m9.update("category_id":8)

m10 = Movie.find_by(title: "The Mummy")
m10.update("category_id":2)

m11 = Movie.find_by(title: "The Nun")
m11.update("category_id":3)

m12 = Movie.find_by(title: "Hannibal")
m12.update("category_id":4)

m13 = Movie.find_by(title: "A Quiet Place")
m13.update("category_id":2)

m14 = Movie.find_by(title: "Black Swan")
m14.update("category_id":4)

m15 = Movie.find_by(title: "The Conjuring 2")
m15.update("category_id":3)

m16 = Movie.find_by(title: "The Conjuring")
m16.update("category_id":3)

m17 = Movie.find_by(title: "Resident Evil: The Final Chapter")
m17.update("category_id":10)

m18 = Movie.find_by(title: "Annabelle: Creation")
m18.update("category_id":3)

m19 = Movie.find_by(title: "Get Out")
m19.update("category_id":4)

m20 = Movie.find_by(title: "Us")
m20.update("category_id":4)

m21 = Movie.find_by(title: "Halloween")
m21.update("category_id":1)

m22 = Movie.find_by(title: "The Ring")
m22.update("category_id":3)

m23 = Movie.find_by(title: "The Blair Witch Project")
m23.update("category_id":3)

m24 = Movie.find_by(title: "Resident Evil: Retribution")
m24.update("category_id":10)

m25 = Movie.find_by(title: "Alien: Covenant")
m25.update("category_id":10)

m26 = Movie.find_by(title: "Annabelle Comes Home")
m26.update("category_id":3)

m27 = Movie.find_by(title: "Constantine")
m27.update("category_id":8)

m28 = Movie.find_by(title: "Hansel & Gretel: Witch Hunters")
m28.update("category_id":9)

m29 = Movie.find_by(title: "Interview with the Vampire")
m29.update("category_id":2)

m30 = Movie.find_by(title: "Dracula Untold")
m30.update("category_id":2)

m31 = Movie.find_by(title: "Bram Stoker's Dracula")
m31.update("category_id":2)

m32 = Movie.find_by(title: "End of Days")
m32.update("category_id":8)

m33 = Movie.find_by(title: "The Others")
m33.update("category_id":3)

m34 = Movie.find_by(title: "Red Dragon")
m34.update("category_id":4)

m35 = Movie.find_by(title: "Paranormal Activity 3")
m35.update("category_id":3)

m36 = Movie.find_by(title: "Sleepy Hollow")
m36.update("category_id":3)

m37 = Movie.find_by(title: "One Cut of the Dead")
m37.update("category_id":11)

m38 = Movie.find_by(title: "Paranormal Activity")
m38.update("category_id":3)

m39 = Movie.find_by(title: "Jaws 2")
m39.update("category_id":2)

m40 = Movie.find_by(title: "The Final Destination")
m40.update("category_id":3)

m41 = Movie.find_by(title: "The Grudge")
m41.update("category_id":3)

m42 = Movie.find_by(title: "Paranormal Activity 2")
m42.update("category_id":3)

m43 = Movie.find_by(title: "AVP: Alien vs. Predator")
m43.update("category_id":10)

m44 = Movie.find_by(title: "Scream")
m44.update("category_id":1)

m45 = Movie.find_by(title: "Scream 2")
m45.update("category_id":1)

m46 = Movie.find_by(title: "Insidious: The Last Key")
m46.update("category_id":3)

m47 = Movie.find_by(title: "Deep Blue Sea")
m47.update("category_id":2)

m48 = Movie.find_by(title: "Saw III")
m48.update("category_id":4)

m49 = Movie.find_by(title: "Alien Resurrection")
m49.update("category_id":10)

m50 = Movie.find_by(title: "Scream 3")
m50.update("category_id":1)

m51 = Movie.find_by(title: "The Ring Two")
m51.update("category_id":3)

m52 = Movie.find_by(title: "The Predator")
m52.update("category_id":10)

m53 = Movie.find_by(title: "Underworld: Awakening")
m53.update("category_id":9)

m54 = Movie.find_by(title: "Alien³")
m54.update("category_id":10)

m55 = Movie.find_by(title: "Resident Evil: Afterlife")
m55.update("category_id":10)

m56 = Movie.find_by(title: "What Lies Beneath")
m56.update("category_id":4)

m57 = Movie.find_by(title: "Split")
m57.update("category_id":4)

m58 = Movie.find_by(title: "Annabelle")
m58.update("category_id":3)

m59 = Movie.find_by(title: "Van Helsing")
m59.update("category_id":9)

m60 = Movie.find_by(title: "The Silence of the Lambs")
m60.update("category_id":4)
