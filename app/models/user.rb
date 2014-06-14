class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :collections

  def name
    email.split("@")[0]
  end

  def collected?(article)
    Collection.where(user: self, article: article).size > 0
  end
end
