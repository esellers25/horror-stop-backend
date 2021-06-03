class UsersController < ApplicationController
    # skip_before_action :logged_in, only: [:create, :login]

    def show
        render json: @user
    end

    def create 
        @user = User.new(user_params)

        if user.valid?
            user.save 
            render json: @user 
        else 
            render json: {error: "Not able to create new user"}
        end 
    end 


    def login 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {username: user.username, id: user.id, token: encode_token({user_id: user.id})}
        else 
            render json: {message: "wrong password"}
        end 
    end 

    def update
        @user.update(user_params)
        render json: user
    end

    def destroy
        @user.destroy
        render json: {message: "User has been SENT TO HELL!!!"}
    end


    private 
    
    def user_params
        params.permit(:username, :password, :avatar)
    end 
end
