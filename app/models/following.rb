class Following < ApplicationRecord
  # The user giving the follow
  belongs_to :follower, class_name: 'User'

  # The user being followed
  belongs_to :followed, class_name: 'User'

  validates :follower_id, uniqueness: { scope: :followed_id }
  validates :followed_id, uniqueness: { scope: :follower_id }
end
