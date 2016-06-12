class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @stories = Story.all.order("created_at DESC")
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to @story
    else
      render "new"
      flash[:danger] = @story.errors.full_messages.to_sentence
    end
  end

  private
    def story_params
      params.require(:story).permit(:body)
    end
end
