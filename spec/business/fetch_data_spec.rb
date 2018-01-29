require 'rails_helper'
require 'unit_helper'
require 'app/business/fetch_data'

describe FetchData do
  subject do
    described_class.new
  end

  describe '#fetch!' do
    it 'should return a hash and populate database' do
      response = subject.fetch!

      expect(response[:organization][:name]).to eq("Pipefy Recruitment Test")
    end
  end
end
