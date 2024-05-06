class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_parent, only: %i[show new create ]

  def index 
    @comments = @article.comments.where(parent_id: nil)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.create(comment_params)
    @comment.parent = @parent
    @comment.user = current_user
    @comment.save
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

  def set_parent
    @parent = Comment.find_by(id: params[:parent_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
