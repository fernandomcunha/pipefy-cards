class Field < ApplicationRecord
  validates :label, :api_id, presence: true
end
