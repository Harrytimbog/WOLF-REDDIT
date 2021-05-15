class Community < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  validates_presence_of :url, :name, :rules
end
