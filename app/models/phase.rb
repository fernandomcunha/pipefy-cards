class Phase < ApplicationRecord
  belongs_to :pipe

  has_many :cards

  validates :name, :pipe, presence: true
end
