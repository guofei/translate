class AddMustLoginToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :must_login, :boolean
  end
end
