class AddSourceAndTargetToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :source, :string
    add_column :articles, :target, :string
  end
end
