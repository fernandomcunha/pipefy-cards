class CardField < ApplicationRecord
  belongs_to :card
  belongs_to :field

  validates :card, :field, :name, :value, presence: true
end
