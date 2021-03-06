class Api::V1::PostsController < ApplicationController
  before_action :set_api_v1_post, only: [:show, :update, :destroy]
   before_action :authenticate_request!
  #before_action :authenticate_user!

  
  def index
    @api_v1_posts = Api::V1::Post.all
    render json: @api_v1_posts
  end

  def show
    render json: @api_v1_post
  end

  def create
    @api_v1_post = Api::V1::Post.new(api_v1_post_params)

    if @api_v1_post.save
      render json: @api_v1_post, status: :created, location: @api_v1_post
    else
      render json: @api_v1_post.errors, status: :unprocessable_entity
    end
  end


  def update
    if @api_v1_post.update(api_v1_post_params)
      render json: @api_v1_post
    else
      render json: @api_v1_post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_v1_post.destroy
  end

  private

    def set_api_v1_post
      @api_v1_post = Api::V1::Post.find(params[:id])
    end


    def api_v1_post_params
      params.require(:api_v1_post).permit(:name, :numbare)
    end
end
