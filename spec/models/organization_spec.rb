require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe '#relationships' do
    it { should have_many(:pipes).dependent(:destroy) }
  end

  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:api_id) }
  end

  describe '#methods' do
    describe '#last_pipe' do
      it 'should return the last Pipe' do
        organization = create(:organization)

        expect(organization.last_pipe).to eq(Pipe.last)
      end
    end

    describe '#all_fields' do
      it 'should return all fields from last pipe' do
        organization = create(:organization)

        expect(organization.all_fields.length).to eq(Field.count)
      end
    end
  end
end
