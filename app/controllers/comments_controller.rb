class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end


end
