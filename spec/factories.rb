FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email_#{n}@example.com" }
    password 'supersecret'
    sequence(:username) { |n| "username_#{n}" }
  end
end
