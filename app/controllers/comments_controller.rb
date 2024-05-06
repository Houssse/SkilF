class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[show edit update destroy]

  def index 
    @comments = @article.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
  end

  def edit
  end
  
  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end
  
  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
