class Field < ApplicationRecord
  has_many :card_fields, dependent: :destroy
  has_many :cards, through: :card_fields

  has_and_belongs_to_many :pipes
  has_and_belongs_to_many :phases

  validates :label, :api_id, presence: true

  scope :by_api_id, ->(api_id) { where(api_id: api_id) }
end
