class Pipe < ApplicationRecord
  belongs_to :organization

  validates :name, :organization, presence: true
end
