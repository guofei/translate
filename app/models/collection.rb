class Collection < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user, :article, presence: true
end
