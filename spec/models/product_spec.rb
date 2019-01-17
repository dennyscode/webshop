require 'rails_helper'
require 'spec_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "very fun toy")}
    let(:user) {User.create!(email: "test@gmx.de", password: "secret")}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful toy!")
      product.comments.create!(rating: 3, user: user, body: "Ok toy!")
      product.comments.create!(rating: 5, user: user, body: "Great toy!")
    end
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end
end
