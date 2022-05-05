class UsersController < ApplicationController
	skip_before_action :authenticate_request, only: [:create]

	def index
		@users = User.all
		render json: @users
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def create

		@user = User.new(set_user)
		@user.save
		render json: @user
	end

	def update
		@user = User.find(params[:id])
		@user = User.update(set_user)
		render json: @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render json: @user
	end

	def set_user
		params.require(:user).permit(:name, :username, :email, :password_digest)
	end
end
