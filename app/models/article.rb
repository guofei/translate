class Article < ActiveRecord::Base
  belongs_to :user
  has_many :collections
  validates :title, :translated_title, :text, :brief, :source, :target, presence: true
end
