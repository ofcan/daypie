FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email_#{n}@example.com" }
    password 'supersecret'
    sequence(:username) { |n| "username_#{n}" }
  end

  factory :pie do
    user
    sequence(:name) { |n| "pie_name_#{n}" }
    sequence(:description) { |n| "a delicious pie_name_#{n}" }
  end

  factory :activity do
    sequence(:title) { |n| "pie_title_#{n}" }
    from_time Time.now + 1
    until_time Time.now + 2
  end
end
