class Bill < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end
