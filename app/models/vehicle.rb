class Vehicle < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy
  has_one_attached :photo

  validates :name,        presence: true,
                          uniqueness: true
  validates :category,    presence: true
  validates :price,       presence: true
  validates :description, presence: true,
                          length: { within: 6..350 }
  validates :kilometer,   presence: true,
                          numericality: true
  validates :year,        presence: true,
                          numericality: true,
                          inclusion: { in: 0..Date.today.year },
                          format: {
                            with: /(18|19|20)\d{2}/i,
                            message: "should be a four-digit year"
                          }
end
