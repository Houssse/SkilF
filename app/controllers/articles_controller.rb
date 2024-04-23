class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article created"
      redirect_to @article 
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
      if @article.update(article_params)
        flash[:notice] = "Article updated"
        redirect_to @article
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end

end
