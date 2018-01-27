class Organization < ApplicationRecord
  has_many :pipes

  validates :name, :api_id, presence: true
end
