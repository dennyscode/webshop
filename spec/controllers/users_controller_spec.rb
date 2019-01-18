require 'rails_helper'
require 'spec_helper'

  require 'rails_helper'

describe UsersController, type: :controller do
  let(:user_one) {User.create!(first_name: "User1", password: "123456", last_name: "Test1", email:"test@testy.com")}
  let(:user_two) {User.create!(first_name: "User2", password: "123456", last_name: "Test2", email:"test2@testy.com")}
  let(:user_admin) {User.create!(first_name: "Admin", admin: true, password: "123456", last_name: "Master", email:"master@testy.com")}


  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user_one
      end

      it 'loads correct user details' do
        get :show, params: {id: user_one.id}
        expect(response).to have_http_status(200) # or be_ok
        expect(assigns(:user)).to eq user_one
      end

      it "cannot access other users details" do
        get :show, params: {id: user_two.id}
        expect(response).to have_http_status(302)
        expect(assigns(:user)).to eq user_two
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to root' do
       get :show, params: { id: user_one.id }
       expect(response).to redirect_to(root_path)
      end
    end
  end
end
