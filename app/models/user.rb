# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :trackable

  validates :first_name, :last_name, :email, presence: true

  has_many :bookings

  def make_admin!
    update(admin: true)
  end

  def make_user!
    update(admin: false)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
