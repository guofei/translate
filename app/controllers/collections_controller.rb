class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection.article, notice: 'Collection was successfully created.' }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  private
  def collection_params
    params.permit(:article_id)
  end
end
