FactoryBot.define do
  sequence(:body) { |n| "comment_factorybot#{n}" }

  factory :comment, class: Comment do
    body
    rating { 5 }
  end
end
