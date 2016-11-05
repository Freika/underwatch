FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { SecureRandom.hex(8) }
    region 'eu'
    battletag "Test##{SecureRandom.hex(2)}"
  end
end
