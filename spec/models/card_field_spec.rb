require 'rails_helper'

RSpec.describe CardField, type: :model do
  describe '#relationships' do
    it { should belong_to(:card) }
    it { should belong_to(:field) }
  end

  describe '#validations' do
    it { should validate_presence_of(:card) }
    it { should validate_presence_of(:field) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:value) }
  end
end
