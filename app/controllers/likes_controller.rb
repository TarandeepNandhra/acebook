class LikesController < ApplicationController
  def index
    @likes = Like.all
    json_response(@likes)
  end

  def create
    @likes = Like.create!(like_params)
    json_response(@likes, :created)
  end

  def destroy
    @likes = Like.destroy_by(user_id: params[:user_id], post_id: params[:post_id])
    render json: {status: 200}
  end

  def show
    @like = Like.find(params[:id])
    json_response(@like)
  end

  def post
    @likes = Like.where(post_id: params[:id])
    json_response(@likes)
  end

  private

  def like_params
    params.permit(:post_id, :user_id)
  end
end
