FactoryBot.define do
  factory :pipe do
    name 'Baz'
    api_id 'API_ID'

    association :organization, factory: :organization

    after(:create) do |pipe|
      create_list(:phase, 5, pipe: pipe)
      create_list(:field, 5, pipes: [ pipe ])
    end
  end
end
