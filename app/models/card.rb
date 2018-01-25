class Card < ApplicationRecord
  belongs_to :phase

  has_many :card_fields
  has_many :fields, through: :card_fields

  validates :phase, :title, presence: true
end
