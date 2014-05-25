class Article < ActiveRecord::Base
  validates :title, :text, :brief, :source, :target, presence: true
end
