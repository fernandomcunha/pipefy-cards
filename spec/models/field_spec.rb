require 'rails_helper'

RSpec.describe Field, type: :model do
  describe '#validations' do
    it { should validate_presence_of(:label) }
  end
end
