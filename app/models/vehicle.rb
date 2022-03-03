class Vehicle < ApplicationRecord
  belongs_to :user

  validates :name,        presence: true,
                          uniqueness: true
  validates :category,    presence: true,
                          uniqueness: true
  validates :price,       presence: true,
                          numericality: true,
                          format: { with: /\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{2})/ }
  validates :description, presence: true,
                          length: { minimum: 6 }
  validates :kilometer,  presence: true,
                          numericality: true
  validates :year,        presence: true,
                          numericality: true
end
