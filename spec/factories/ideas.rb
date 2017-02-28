FactoryGirl.define do
  factory :idea do
    user

    title {Faker::RockBand.name}
    description {Faker::Lorem.paragraph(1)}
    user_id {Faker::Number}

  end
end
