require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    describe "GET #index" do
        let!(:users) { FactoryBot.create_list :user,2} #Tạo biến @users tuong uong voi controller va set gia tri cho bien
        before { get :index }
        let!(:valid_attributes) do
            {
            'id' => '100',
            'name' => 'khangnx',
            'hashed_password'=> '31ad13d3aa272c586d77ddd863d298b2c7ed7c488994a7bbbe373180ddc57d94',
            'salt' =>  '853600.08778741363391418',
            'email' =>  'vfa.khangnx@gmail.com',
            }
        end
        it "return success response index" do
            login
            get 'index'
            expect(response).to have_http_status(:success)
            expect(users.count).to eq(2)
        end
        it "return success response show" do
            login
            get :show, :params => valid_attributes
            expect{response}.to change{User.count}.by(0)
        end
        it "return success response edit" do
            login
            @user = User.find(100)
            put :update, :params => {:id => @user.id, :user => {:email => "new@email.com"}}
            @user = User.find(100) #reload user after update
            # put :update, :id => @user.id, :user => 
            expect(@user.email).to eq("new@email.com")
        end
        it 'creates an error message' do
            delete :destroy, :params => {id: 298486374}, format: :json
          end
    end
end