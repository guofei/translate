class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user, index: true
      t.references :article, index: true

      t.timestamps
    end
  end
end
