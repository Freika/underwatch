FactoryGirl.define do
  factory :event do
    title { FFaker::Name.name }
    description { FFaker::Lorem.paragraph }
    mode { Event.modes.keys.sample }
    user
  end
end
