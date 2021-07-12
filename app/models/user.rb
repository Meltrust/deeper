class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false },
                       format: { with: /^[a-zA-Z0-9_.]*$/, message: 'Only letters and numbers', multiline: true }
  validates :email, presence: true
  validates :fullname, presence: true

  has_many :deeps
end
