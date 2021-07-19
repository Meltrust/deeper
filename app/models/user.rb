class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false },
                       format: { with: /^[a-zA-Z0-9_.]*$/, message: 'Only letters and numbers', multiline: true }
  validates :email, presence: true
  validates :fullname, presence: true

  has_many :deeps, dependent: :destroy

  # ---- START OF FOLLOWING MODEL ASSOCIATIONS. ----

  # For reference, in the Following model there is:
  # The user giving the follow:
  # belongs_to :follower, class_name: 'User'

  # The user being followed:
  # belongs_to :followed, class_name: 'User'

  # FOLLOW OTHER USERS.

  # A User can follow many other users, 'followed_users' and calls foreing key follower_id from the Following model.
  # The users ID can then be associated to the Following model scheme as the follower.

  # Returns an array of follows a user gave to someone else (given follows.)
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'

  # Says that a user has many followeds through the followed_users established in the line above.

  # Returns an array of other users who the user has followed
  has_many :followeds, through: :followed_users
  # Rails can infer the source, or one can be specific: source: :followed

  # BE FOLLOWED BY OTHER USERS.

  # A User can have many users follow them, and the followed_id can
  # be used to associate a users ID to the follow as the followed.

  # Will return an array of follows for the given user instance (received follows.)
  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'

  # A user has many followers through the following_users established in the line above.

  # Will return an array of users who follow the user instance
  has_many :followers, through: :following_users
  # Rails can infer the source, or one can be specific: source: :follower

  # ---- END OF FOLLOWING ASSOCIATIONS ----

  # Photo and cover pics associations.
  # Attach photo and cover pic
  has_one_attached :photo
  has_one_attached :cover_image

  # Attach default photo and cover on signup or edit profile if one is not attached  already.
  after_commit :add_default_photo, on: %i[create update]
  after_commit :add_default_cover, on: %i[create update]

  private

  def add_default_photo
    return if photo.attached?

    photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_photo.png')),
                 filename: 'default_photo.png')
  end

  def add_default_cover
    return if cover_image.attached?

    cover_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover-image.png')),
                       filename: 'default-cover-image.png')
  end
end
