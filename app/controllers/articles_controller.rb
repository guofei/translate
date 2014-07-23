class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
    @translation = Translation.new(article_id: @article.id, version: params[:v])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    respond_to do |format|
      if @article.save
        @translation = Translation.new(article_id: @article.id, text: @article.text, name: current_user.name, email: current_user.email)
        @translation.init_bare
        format.html { redirect_to @article, notice: 'Article was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :translated_title, :original_link, :brief, :text, :source, :target, :must_login)
  end

  def correct_user
    user = @article.user
    redirect_to(root_path) unless current_user == user
  end
end
