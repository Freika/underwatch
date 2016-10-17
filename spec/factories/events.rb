FactoryGirl.define do
  factory :event do
    title { FFaker::Movie.title }
    description { FFaker::Lorem.paragraph }
    difficulty { rand(0..2) }
  end
end
