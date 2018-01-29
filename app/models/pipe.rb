class Pipe < ApplicationRecord
  belongs_to :organization

  has_many :phases, dependent: :destroy

  has_and_belongs_to_many :fields

  validates :name, :organization, :api_id, presence: true

  def all_cards
    phases.map(&:cards).flatten
  end
end
