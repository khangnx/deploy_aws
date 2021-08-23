require 'digest/sha2'
include ValidatesUserSignup
class User < ApplicationRecord
    validates :name,  :presence => true, :uniqueness => true 
    validates :password, :confirmation => true
    attr_accessor :password_confirmation
    attr_reader :password
    validate :password_must_be_present
    validates :email, email: true, :presence => true
    after_save :clear_cache
    has_many :posts

    def User.encrypt_password(password, salt)
        Digest::SHA2.hexdigest(password + salt)
    end

    def password=(password)
        @password = password
        if password.present?
            generate_salt
            self.hashed_password = self.class.encrypt_password(password,salt)
            puts self.hashed_password
        end
    end

    def User.authenticate(name, password)
        if user = find_by_name(name)
            if user.hashed_password == encrypt_password(password,user.salt)
                user
            end
        end
    end

    private
    def password_must_be_present 
        if hashed_password.present? == false
            errors.add(:password, "Missing password")
        end
    end
  
    def generate_salt
        self.salt = self.object_id.to_s + rand.to_s
    end

    def clear_cache
        $redis.del "users"
    end
end
