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
  has_one_attached :photo

  after_commit :add_default_photo, on: %i[create update]

  private

  def add_default_photo
    unless photo.attached?
      photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_photo.png')),
                   filename: 'default_photo.png')
    end
  end
end
