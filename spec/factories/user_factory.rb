FactoryBot.define do
  factory :user do
    name 'Piotr Brudny'
    city 'Warszawa'
    sequence(:email) { |n| "myemail#{n}@gmail.com" }
    password 'secret'
  end
end
