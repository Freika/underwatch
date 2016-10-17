FactoryGirl.define do
  factory :run do
    title { FFaker::Movie.title }
    description { FFaker::Lorem.paragraph }
    user
  end
end
