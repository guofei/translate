class TranslationsController < ApplicationController
  def create
    @translation = Translation.new(params[:translation])
    @translation.name = user_signed_in? ? current_user.name : remote_ip
    @translation.email = current_user.email if user_signed_in?

    respond_to do |format|
      if user_signed_in? || !@translation.article.must_login
        @translation.update_page
      end
      format.html { redirect_to @translation.article, notice: 'Translation was successfully created' }
    end
  end

  private

  def remote_ip
    request.remote_ip
  end
end
