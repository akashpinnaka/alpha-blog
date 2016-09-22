class ArticlesController < ApplicationController

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
    @article = Article.new article_params
    flash[:notice] = "Article was successfully created"
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update article_params
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(:id)
  end
end