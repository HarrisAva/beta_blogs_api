require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /index" do
    let(:blog) { create(:blog) }
    
      before do 
        blog
        get '/blogs'
      end
  
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
  
      it 'returns a list of blogs' do
        expect(response.body).to eq(Blog.all.to_json)
      end
  end

    describe "POST /blogs" do
      let (:user) { create(:user) }
      let (:token) {auth_token_for_user(user)}
    
        context 'when the blog is valid' do
          before do
            blog_attributes = attributes_for(:blog)
            post "/blogs", params: blog_attributes
          end
    
          it 'returns http created' do
            expect(response).to be_successful
          end
    
          it 'returns the created blog' do
            expect(Blog.count).to eq(1)
          end
        end
        end
    
        context 'when the blog is invalid' do
          before do
            post '/blogs', params: {  title: 'Test Title', content: 'Test Content', user_id: nil }
          end
    
          it 'returns http unprocessable entity' do
            expect(response).to have_http_status(:unprocessable_entity)
          end
    
          it 'returns the validation errors' do
            expect(JSON.parse(response.body)).to eq({"user"=>["must exist"]})
          end
        end
      end

  #  let method in RSpec is lazy-evaluated. This means that the code inside let (create(:user)) won't actually run until user is explicitly called in the test. If you didn't call user before get :index, no user would be created, and your index action would be returning an empty array (assuming the database is empty to start with).