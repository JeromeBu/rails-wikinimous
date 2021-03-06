class ArticlesController < ApplicationController

  before_filter :authorize, only: [:show, :index]

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_para)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_para)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end



  private

  def article_para
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
