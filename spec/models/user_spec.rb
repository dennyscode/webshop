require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(first_name:"Test", last_name: "Name", password: "secret", email:"test@mail.com")
  end

  describe "validations" do
    it "it should not have item created if password or mail is missing" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end

end

describe User do
  # context "User needs to have an email-adress" do
    let(:user){User.create!(email:"user@email.com", password:"secret")}

    it "it is a valid email" do
      expect(user.email).to eq "user@email.com"
    end

    it "it is a valid password" do
      expect(user.password).to eq "secret"
    end

    it "it is not valid without email" do
    user.email = nil
      expect(user).to_not be_valid
    end
end
