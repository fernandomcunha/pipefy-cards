FactoryBot.define do
  factory :phase do
    name 'BarFoo'
    api_id 'API_ID'

    after(:create) do |phase|
      create_list(:card, 5, phase: phase)
      create_list(:field, 5, phases: [ phase ])
    end
  end
end
