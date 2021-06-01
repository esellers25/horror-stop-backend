class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
        render json: reviews
    end

    def create
        @review = Review.new(review_params)

        if @review.valid?
            @review.save
            render json: @review
        else
            render json:  {message :"NOT A REAL REVIEW YOU JERK"}
        end
    end

    def update
        @review.update(review_params)
        render json: @review
    end

    def destroy
        @review.destroy
        render json: {message: "This review has been sent TO HELL!!!"}
    end

    private

    def review_params
        params.require(:review).permit(:rating, :spook_factor, :comment, :user_id, :movie_id)
    end
end
