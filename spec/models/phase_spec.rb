require 'rails_helper'

RSpec.describe Phase, type: :model do
  describe '#relationships' do
    it { should belong_to(:pipe) }
  end

  describe '#validations' do
    it { should validate_presence_of(:pipe) }
    it { should validate_presence_of(:name) }
  end
end
