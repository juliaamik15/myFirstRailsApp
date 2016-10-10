require 'rails_helper'

describe UsersController, :type => :controller do

	before do
		#@user = User.create!(email: "testuser@gmail.com", password: "123456")
		@user = FactoryGirl.create(:user)
		@admin = FactoryGirl.create(:admin)
		@user2 = FactoryGirl.create(:user)
		#@user2 = User.create!(email: "testuser2@gmail.com", password: "123456")
		#@admin = User.create!(email: "testadmin@gmail.com", password: "123456", admin: true)
	end

	describe 'GET #show' do
		
		context 'User is logged in' do
			before do
				sign_in @user
			end
			
			it 'redirects to show' do
				
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end
    end

    context 'No user is logged in' do

      it 'redirects to login' do
        get :show, id: @user.id
        expect(response).to redirect_to(new_user_session_path)
       end

    end

    context 'Nobody except admin can edit other users details' do
			before do
				sign_in @user
			end

			it 'not admin redirects to home' do
				get :edit, id: @user2.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end

			it 'admin can open another user edit page' do
				sign_in @admin
				get :edit, id: @user2.id
				expect(response).to have_http_status(200)

			end

    end

	end
end