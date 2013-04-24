class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :artist, presence: true
  validates :url, presence: true
end