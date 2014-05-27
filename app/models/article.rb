class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :text, :brief, :source, :target, presence: true
end
