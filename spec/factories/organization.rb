FactoryBot.define do
  factory :organization do
    name 'FooBar'
    api_id 'API_ID'

    after(:create) do |organization|
      create_list(:pipe, 1, organization: organization)
    end
  end
end
