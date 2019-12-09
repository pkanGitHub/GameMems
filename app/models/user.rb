class User < ActiveRecord::Base
    has_secure_password
    has_many :games
    validates :username, :password, presence: true
    validates :username, uniqueness: true

end