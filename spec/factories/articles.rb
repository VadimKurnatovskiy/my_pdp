FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph(10) }
    user
  end
end
