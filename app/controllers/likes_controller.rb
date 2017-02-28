class LikesController < ApplicationController
  before_action :find_idea, only: [:create]

  def create
    @like = @idea.likes.create
    redirect_to ideas_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to ideas_path
  end

  private
    def find_idea
      @idea = Idea.find(params[:idea_id])
    end
end
