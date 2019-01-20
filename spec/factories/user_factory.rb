FactoryBot.define do
  sequence(:email) { |n| "user_factorybotty#{n}@example.com" }
  sequence(:first_name) { |n| "userfirstname_#{n}" }
  sequence(:last_name) { |n| "userlastname_#{n}" }
  #normally -->
  #factory :user, class: User do
  #but factory´s convention finds corresponding class like:
  factory :user, class: User do
    password { "0123456789" }
    first_name
    last_name
    admin { false }
    email
  end

  factory :admin, class: User do
    password { "0123456789" }
    first_name
    last_name
    admin { true }
    email
  end

end
