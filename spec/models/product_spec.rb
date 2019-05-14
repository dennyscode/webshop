require 'rails_helper'
require 'spec_helper'



RSpec.describe Product do
  before(:each) do
    @product = Product.create!(name:"TestProduct", description: "TestDescription for TestProduct", image_url: "test-image-url", colour:"TestColour", prize:"100", quantity:"1")
  end
  context 'when the product has valid attributes entries' do
    it 'will create the product' do
      expect(@product).to be_valid
    end
  end
  context 'when the product has invalid attributes entered' do
    it 'wont create the product when no name is entered' do
      @product.name = nil
      expect(@product).to be_invalid
    end
  end

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
