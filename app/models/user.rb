class User < ApplicationRecord
    has_one :eventlist
    has_secure_password
    validates_uniqueness_of :username
    has_secure_token :session_token, length: 36
end
