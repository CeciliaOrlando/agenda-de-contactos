class Contact < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :phone_numbers
  has_one :address
  has_one :category
  has_one_attached :photo

  # Validations
  validates :full_name, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :email, presence: true
end
