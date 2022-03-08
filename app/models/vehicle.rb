class Vehicle < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy
  has_many_attached :photos

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

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :price, :description, :year ],
    using: {
      tsearch: { prefix: true }
    }

end
