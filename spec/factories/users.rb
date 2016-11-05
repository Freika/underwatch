FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { SecureRandom.hex(8) }
    region 'eu'
    battletag  { "#{FFaker::Lorem.word}##{SecureRandom.hex(2)}" }
  end
end
