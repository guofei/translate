require 'gollum-lib'

class TranslationsController < ApplicationController
  def create
    @translation = Translation.new(params[:translation])
    @translation.update_page

    respond_to do |format|
      format.html { redirect_to Article.find(@translation.article_id), notice: 'Translation was successfully created' }
    end
  end
end
