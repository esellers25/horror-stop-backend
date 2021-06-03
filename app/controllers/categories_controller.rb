class CategoriesController < ApplicationController
    # skip_before_action :logged_in, only: [:index]
    
    def index 
        @categories = Category.all 
        render json: @categories
    end 
end
