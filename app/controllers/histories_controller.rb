class HistoriesController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @translation = Translation.new(article_id: @article.id, version: params[:id])
  end
end
