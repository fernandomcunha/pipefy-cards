class Phase < ApplicationRecord
  belongs_to :pipe

  has_many :cards

  has_and_belongs_to_many :fields

  validates :name, :pipe, presence: true
end
