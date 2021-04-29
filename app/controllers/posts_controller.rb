class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at).reverse_order!
    json_response(@posts)
  end

  def show
    @post = Post.find(params[:id])
    json_response(@post)
  end

  def create
    @posts = Post.create!(post_params)
    json_response(@posts, :created)
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.permit(:content, :user_id)
  end
end
