class MoviesController < ApplicationController

    def index
        @movies = Movie.all
        render json: @movies
    end 

    def show
        @movie = Movie.find(params[:id])
        render json: @movie
    end

    def movie_rating_average

      
        @movie = Movie.find(params[:id])
        
        if @movie.reviews.length > 0
            ratings = @movie.reviews.map{|reviews| reviews.rating}
        
            avg = (ratings.sum.to_f/ratings.count.to_f)
            render json: avg
        else
            render json: {message: "No rating available"}
        end
    end

    def average_rating
        @movie = Movie.find(params[:id])

    end
    
end
