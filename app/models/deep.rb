class Deep < ApplicationRecord
  validates :text, presence: true, length: { maximum: 1000,
                                             too_long: '1000 characters in deep is the maximum allowed.' }

  has_many :likes, dependent: :destroy
  belongs_to :user

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
