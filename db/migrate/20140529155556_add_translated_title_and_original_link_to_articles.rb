class AddTranslatedTitleAndOriginalLinkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :translated_title, :string
    add_column :articles, :original_link, :string
  end
end
