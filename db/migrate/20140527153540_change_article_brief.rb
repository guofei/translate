class ChangeArticleBrief < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :articles do |t|
        dir.up   { t.change :brief, :text, limit: nil }
        dir.down { t.change :brief, :string }
      end
    end
  end
end

