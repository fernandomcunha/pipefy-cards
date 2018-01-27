require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#relationships' do
    it { should belong_to(:phase) }
    it { should have_many(:card_fields) }
    it { should have_many(:fields).through(:card_fields) }
  end

  describe '#validations' do
    it { should validate_presence_of(:phase) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:api_id) }
  end
end
