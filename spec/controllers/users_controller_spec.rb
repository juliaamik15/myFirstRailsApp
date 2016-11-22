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

	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:admin) }
	let(:user2) { FactoryGirl.create(:user) }

	subject {get :show, id: id}

	describe 'GET #show' do
		
		context 'User logged in' do
			let (:id) { user.id }
			before do
				sign_in user
			end
			
			it 'is redirected to show' do
				get :show, id: user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user
			end
    end

    context 'User not logged in' do
      it 'is redirected to login page' do
      	get :show, id: user.id
        expect(response).to redirect_to(new_user_session_path)
       end

    end

    context 'normal user logged in' do
			let(:id) { user2.id }

			before do
				sign_in user
			end

			it 'redirects to home' do
				get :edit, id: user2.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end

		context 'admin logged in' do

			before do
				sign_in admin
			end

			it 'can open another user edit page' do
				get :edit, id: user2.id
				expect(response).to have_http_status(200)

			end

    end

	end
end