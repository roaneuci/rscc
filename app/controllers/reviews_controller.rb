class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  before_action :authenticate_user!
 
  respond_to :html

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.post_id = @post.id
    if @review.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def review_params
      params.require(:review).permit(:comment)
    end
end
