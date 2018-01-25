class Card < ApplicationRecord
  belongs_to :phase

  validates :phase, :title, presence: true
end
