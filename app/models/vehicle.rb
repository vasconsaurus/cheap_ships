class Vehicle < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: true
end
