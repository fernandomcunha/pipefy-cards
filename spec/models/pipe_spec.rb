require 'rails_helper'

RSpec.describe Pipe, type: :model do
  describe '#relationships' do
    it { should belong_to(:organization) }
    it { should have_many(:phases).dependent(:destroy) }
    it { should have_and_belong_to_many(:fields) }
  end

  describe '#validations' do
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:api_id) }
  end

  describe '#methods' do
    describe '#all_cards' do
      it 'should return all cards from a pipe' do
        organization = create(:organization)

        expect(organization.last_pipe.all_cards.length).to eq(Card.count)
      end
    end
  end
end
