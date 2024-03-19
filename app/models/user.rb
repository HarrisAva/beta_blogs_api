class User < ApplicationRecord
    has_one :profile
    has_many :blogs
    after_create :create_profile
    # all user created will have user profile
    has_many :monthly_summaries
    has_many :likes
    
    validates :username, :email, :first_name, :last_name, presence: true

    has_secure_password

end
