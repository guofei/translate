class Article < ActiveRecord::Base
  validates :title, :text, :brief, presence: true
end
