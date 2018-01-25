require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#relationships' do
    it { should belong_to(:phase) }
  end

  describe '#validations' do
    it { should validate_presence_of(:phase) }
    it { should validate_presence_of(:title) }
  end
end
