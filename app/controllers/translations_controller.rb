class TranslationsController < ApplicationController
  def create
    @translation = Translation.new(params[:translation])
    @translation.name = current_user.name if user_signed_in?
    @translation.email = current_user.email if user_signed_in?
    @translation.update_page

    respond_to do |format|
      format.html { redirect_to Article.find(@translation.article_id), notice: 'Translation was successfully created' }
    end
  end
end
