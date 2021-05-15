class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments

  validates_presence_of :title, :body, :user_id, :community_id
end
