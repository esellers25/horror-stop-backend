class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, "Spooky")
    end 

    # def logged_in
    #     headers = request.headers["Authorization"]
	# 	token = headers.split(" ")[1]	

	# 	begin
	# 		user_id = JWT.decode(token, "Spooky")[0]["user_id"]
	# 		@user - User.find(user_id)
	# 	rescue 
				
	# 		@user = nil
	# 	end 
	# 	unless @user 
	# 	render json: {error: "Please Login!"} 

	# end 

    # end 
end
