require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do

    context 'with valid attributes' do

      before do
        user_attributes = attributes_for(:user)
        post "/users", params: user_attributes
      end
      it 'returns a success response' do
        expect(response).to be_successful
      end
      it 'create a new user' do
        expect(User.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      before do
        user_attributes = attributes_for(:user, first_name: nil)
        post "/users", params: user_attributes
      end
      it 'returns an error response' do
        expect(response.status).to eq(422)
      end
    end
  end
end

