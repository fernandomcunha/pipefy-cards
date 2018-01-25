class Field < ApplicationRecord
  validates :label, presence: true
end
