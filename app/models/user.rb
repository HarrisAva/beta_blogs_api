class User < ApplicationRecord
    has_one :profile
    has_many :blogs
    after_create :create_profile
    # all user created will have user profile

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :username, presence: true

end
