class Post < ActiveRecord::Base
  belongs_to :user
  
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :artist, presence: true
  validates :url, presence: true

  def vote_total
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
  
end