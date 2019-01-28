FactoryBot.define do
  sequence(:name) { |n| "product_factorybot#{n}" }
  sequence(:description) { |n| "description_#{n}" }
  #normally -->
  #factory :product, class: Product do
  #but factory´s convention finds corresponding class like:
  factory :product, class: Product do
    name
    description
    colour { "colorful_factory" }
    prize { 10 }
    quantity { 10 }
  end
end
