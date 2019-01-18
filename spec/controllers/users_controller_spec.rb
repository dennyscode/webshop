require 'rails_helper'


describe UsersController, type: :controller do
  @user_one = FactoryBot.create(:user_one)
  @user_two = FactoryBot.create(:user_two)
  @user_admin = FactoryBot.create(:user_admin)


  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user_one
      end

      it 'loads correct user details' do
        get :show, params: {id: @user_one.id}
        expect(response).to have_http_status(200) # or be_ok
        expect(assigns(:user)).to eq @user_one
      end

      it "cannot access other users details" do
        get :show, params: {id: @user_two.id}
        expect(response).to have_http_status(302)
        expect(assigns(:user)).to eq @user_two
      end
    end

    context 'when a user is signed in and has admin rights' do
      before do
        sign_in @user_admin
      end
      it "can access other´s details if admin rights granted" do
        get :show, params: {id: @user_two.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user_second
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
       get :show, params: { id: @user_one.id }
       expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
