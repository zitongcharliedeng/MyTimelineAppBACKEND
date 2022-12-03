class User < ApplicationRecord
    has_one :eventlist
    has_secure_password
    validates_uniqueness_of :username
end
