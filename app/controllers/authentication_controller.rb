class AuthenticationController < ApplicationController
	 #skip_before_action :verify_authenticity_token
	  def login
	  
	  	user = User.find_by_email(params[:email])
	  		token = jwt_encode(user_id: user.id, current_user: user.id)
	  		render json: {token: token}
	  end
	  def jwt_decode( token)
         
		   decoded = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key])[0]
		   HashWithIndifferentAccess.new decoded
      end
      def jwt_encode(payload, exp = 7.days.from_now)
		   payload[:exp] = exp.to_i
		   JWT.encode(payload, Rails.application.credentials.devise[:jwt_secret_key])
      end


end
