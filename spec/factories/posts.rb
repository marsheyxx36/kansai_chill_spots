FactoryBot.define do
  factory :post do
    name  { Faker::Address.city}
    description {Faker::Lorem.sentences}
    address {Faker::Address.full_address}
    latitude {Faker::Address.latitude}
    longitude{Faker::Address.longitude }
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/hertzagfa01_TP_V.jpg'), filename: 'hertzagfa01_TP_V.jpg')
    end
  end
end
