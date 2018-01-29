class Organization < ApplicationRecord
  has_many :pipes

  validates :name, :api_id, presence: true

  def last_pipe
    pipes.try(&:last) || (pipes << Pipe.new).last
  end

  def all_fields
    fields = []

    return fields if last_pipe.nil?

    last_pipe.fields.each do |field|
      fields << field
    end

    last_pipe.phases.map(&:fields).flatten.each do |field|
      fields << field
    end

    fields
  end
end
