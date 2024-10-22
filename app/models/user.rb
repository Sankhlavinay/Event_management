class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :role, presence: true


  def organizer?
    role == 'organizer'
  end

  def attendee?
    role == 'attendee'
  end
end
