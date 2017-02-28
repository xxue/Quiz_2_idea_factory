class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @idea = Idea.new
    # @user = User.all
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    # @idea.user = @user
    if @idea.save
      flash[:notice] = 'Idea posted!'
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def index
     @ideas = Idea.order(created_at: :desc)
  end

  def show
    @review = Review.new
    @reviews = @idea.reviews
  end

  def edit
    if current_user != @idea.user
      redirect_to root_path, alert: 'Only idea creator authorized to edit!'
    end
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea), notice: 'Idea updated!'
    else
      render :edit
      # edit form
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: 'Idea deleted!'
  end


  private
    def idea_params
      params.require(:idea).permit(:id, :title, :description, :user_id)
    end

    def find_idea
      @idea = Idea.find params[:id]
    end

    def authorize
        if cannot?(:manage, @idea)
          redirect_to root_path, alert: 'Not authorized!'
        end
    end
end
