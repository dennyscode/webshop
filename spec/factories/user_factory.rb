FactoryBot.define do
  #normally -->
  #factory :user, class: User do
  #but factory´s convention finds corresponding class like:
  factory :user_one, class: User do
    email "johnny1@example.com"
    password "1234567890"
    first_name "John"
    last_name "Example"
    admin false
  end

  factory :user_two, class: User do
    email "thomas1@example.com"
    password "1234567890"
    first_name "Thomas"
    last_name "Example"
    admin false
  end

  factory :user_admin, class: User do
    email "thomas1@example2.com"
    password "1234567890"
    first_name "Tom"
    last_name "Example"
    admin true
  end

end
