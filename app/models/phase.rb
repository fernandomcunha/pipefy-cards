class Phase < ApplicationRecord
  belongs_to :pipe

  validates :name, :pipe, presence: true
end
