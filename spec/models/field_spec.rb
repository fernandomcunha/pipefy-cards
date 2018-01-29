require 'rails_helper'

RSpec.describe Field, type: :model do
  describe '#relationships' do
    it { should have_many(:card_fields).dependent(:destroy) }
    it { should have_many(:cards).through(:card_fields) }
    it { should have_and_belong_to_many(:phases) }
    it { should have_and_belong_to_many(:pipes) }
  end

  describe '#validations' do
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:api_id) }
  end
end
