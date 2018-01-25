require 'rails_helper'

RSpec.describe Pipe, type: :model do
  describe '#relationships' do
    it { should belong_to(:organization) }
  end

  describe '#validations' do
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:name) }
  end
end
