class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: :show

  def index 
    @comments = @article.comments
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
end
