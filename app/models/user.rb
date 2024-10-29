class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLE = ["Organizer", "Attendee"]

  validates :email, :role, presence: true

  has_many :bookings, dependent: :destroy
  has_many :events, through: :bookings

  has_many :tickets
  
  def organizer?
    role == 'Organizer'
  end

  def attendee?
    role == 'Attendee'
  end

  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end
