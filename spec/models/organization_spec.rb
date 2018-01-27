require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe '#relationships' do
    it { should have_many(:pipes) }
  end

  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:api_id) }
  end
end
