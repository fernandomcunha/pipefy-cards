class Pipe < ApplicationRecord
  belongs_to :organization

  has_many :phases

  validates :name, :organization, presence: true
end
