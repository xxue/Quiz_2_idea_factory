class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
before_action(:find_review, { only: [:edit, :destroy, :update] })
  before_action(:find_idea, { only: [:create, :destroy] })
  def create
    @review = @idea.reviews.build(review_params)

    if @review.save
        redirect_to idea_path(@idea)
      else
        flash.now[:alert] = 'Error'
        render "ideas/show"
      end
    end

  def index
     @reviews = Review.latest_first
  end

  def edit
      if current_user != @review.user
        redirect_to root_path, alert: 'not authorized!'
      end
  end

  def update
    if @review.update review_params
      redirect_to idea_path(@review.idea), notice: 'Review updated!'
    else
      render :edit
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to idea_path(review.idea_id), notice: 'Review was deleted!'
  end

  private

    def review_params
      params.require(:review).permit(:body)
    end

    def find_review
      @review = Review.find params[:id]
    end

    def find_idea
      @idea = Idea.find(params[:idea_id])
    end

end
