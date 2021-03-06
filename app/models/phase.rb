class Phase < ApplicationRecord
  belongs_to :pipe

  has_many :cards, dependent: :destroy

  has_and_belongs_to_many :fields

  validates :name, :pipe, :api_id, presence: true
end
