class TranslationsController < ApplicationController
  def create
    @translation = Translation.new(params[:translation])
    @translation.name = user_signed_in? ? current_user.name : client_ip
    @translation.email = current_user.email if user_signed_in?
    @translation.update_page

    respond_to do |format|
      format.html { redirect_to Article.find(@translation.article_id), notice: 'Translation was successfully created' }
    end
  end

  private

  def client_ip
    ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    ip.gsub(/[0-9]+$/, "*")
  end
end
