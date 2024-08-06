class Category < ApplicationRecord
  # Associations
  belongs_to :contact

  # Validations
  validates :family, :friend, :customer, :supplier, inclusion: { in: [true, false] }
end
