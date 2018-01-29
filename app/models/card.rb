class Card < ApplicationRecord
  belongs_to :phase

  has_many :card_fields, dependent: :destroy
  has_many :fields, through: :card_fields

  validates :phase, :title, :api_id, presence: true
end
