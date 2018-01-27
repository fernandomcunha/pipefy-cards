require 'rails_helper'

RSpec.describe Phase, type: :model do
  describe '#relationships' do
    it { should belong_to(:pipe) }
    it { should have_many(:cards) }
    it { should have_and_belong_to_many(:fields) }
  end

  describe '#validations' do
    it { should validate_presence_of(:pipe) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:api_id) }
  end
end
