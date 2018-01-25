class Organization < ApplicationRecord
  has_many :pipes

  validates :name, presence: true
end
