class Pipe < ApplicationRecord
  belongs_to :organization

  has_many :phases

  has_and_belongs_to_many :fields

  validates :name, :organization, :api_id, presence: true
end
