require 'rails_helper'
require 'spec_helper'

RSpec.describe Comment, type: :model do
  context "when the comment is being validated" do

      it "has all attributes and is valid" do
          @product = Product.create!(name:"TestProduct", description: "TestDescription for TestProduct", image_url: "test-image-url", colour:"TestColour", prize:"100", quantity:"1")
          @comment = FactoryBot.build(:comment, user_id:1,product_id:@product.id)
          expect(@comment).to be_valid
      end

      it "comment is invalid without a body" do
          @comment = FactoryBot.build(:comment, body: nil)
          expect(@comment).not_to be_valid
      end

      it "comment is invalid without a user" do
          @comment = FactoryBot.build(:comment, user: nil)
          expect(@comment).not_to be_valid
      end

      it "comment is invalid without a product" do
          @comment = FactoryBot.build(:comment, product: nil)
          expect(@comment).not_to be_valid
      end

      it "comment is invalid without a rating" do
          @comment = FactoryBot.build(:comment, rating: nil)
          expect(@comment).not_to be_valid
      end

      it "comment is invalid if rating is not integer" do
          @comment = FactoryBot.build(:comment, rating: "hello")
          expect(@comment).not_to be_valid
      end
  end
end
