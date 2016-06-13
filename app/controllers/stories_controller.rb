class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]
  def index
    @stories = Story.all.order("created_at DESC").page(params[:page]).per(5)
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

  def upvote
    @story = Story.find(params[:id])
    @story.upvote_by(current_user)
    redirect_to :back
  end

  def downvote
    @story = Story.find(params[:id])
    @story.downvote_by(current_user)
    redirect_to :back
  end

  def search
    # urlの:searchが空だったら
    if params[:search].blank?
      # story全話
      @stories = Story.all
    else
      # storyでurlに:searchをもつもの
      @stories = Story.search(params)
    end
  end

  private
    def story_params
      params.require(:story).permit(:body)
    end
end
