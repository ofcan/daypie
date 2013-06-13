FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email_#{n}@example.com" }
    password 'supersecret'
    sequence(:username) { |n| "username_#{n}" }
  end

  factory :pie do
    sequence(:name) { |n| "pie_name_#{n}" }
    description 'a delicious pie'
  end

end
