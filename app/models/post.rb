class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments

  validates_presence_of :title, :body, :user_id, :community_id

  def score
    # difference between upvotes and downvotes
    if self.upvotes > 0 || self.downvotes > 0
      self.upvotes > 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
    else
      0
    end
  end
end
