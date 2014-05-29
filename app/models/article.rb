class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :translated_title, :text, :brief, :source, :target, presence: true
end
