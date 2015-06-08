FactoryGirl.define do
  factory :site do
    id 1
    name "MySite"
    subdomain "foo"
  end

  factory :user do
    site_id 1
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :followed_user, class: User do
    site_id 1
    sequence(:name)  { |n| "Person2 #{n}" }
    sequence(:email) { |n| "person2_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :unfollowed_user, class: User do
    site_id 1
    sequence(:name)  { |n| "Person3 #{n}" }
    sequence(:email) { |n| "person3_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end

  factory :micropost do
    site_id 1
    wants_item "Lorem"
    has_item "Ipsum"
    user
  end

  factory :trade_item1 do
    id 1
    name "trade_item1"
  end

  factory :trade_item2 do
    id 2
    name "trade_item2"
  end
end