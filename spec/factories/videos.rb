FactoryBot.define do
  factory :video do
    title { FFaker::Name.name }
    wistia { FFaker::Youtube.url }
    description { FFaker::Lorem.sentence }

    factory :invalid_video do
      title nil
    end
  end
end
