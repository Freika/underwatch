FactoryGirl.define do
  factory :participation do
    user
    event
    approved false
  end
end
