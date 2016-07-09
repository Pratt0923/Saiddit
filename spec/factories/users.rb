FactoryGirl.define do
  factory :user do
    email "email@email.com"
    password "password"
    rank "general_user"
    confirmed_at DateTime.now
      factory :admin do
        rank "admin"
      end
    end
  end
