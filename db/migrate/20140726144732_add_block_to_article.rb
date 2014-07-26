class AddBlockToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :block, :boolean
  end
end
