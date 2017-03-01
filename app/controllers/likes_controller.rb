class LikesController < ApplicationController

  before_action :find_like, only: [:destroy]
  before_action :find_idea, only: [:create]

  def create
    # @like = @idea.likes.create
    # redirect_to ideas_path
    like = Like.new(user: current_user, idea: @idea)
    if like.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    if @like.destroy
       redirect_to root_path
    end
  end

  private
    def find_idea
      @idea ||= Idea.find(params[:idea_id])
    end

    def find_like
        @like ||= Like.find(params[:id])
    end
end
