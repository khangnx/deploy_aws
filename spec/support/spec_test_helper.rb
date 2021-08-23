module SpecTestHelper
    def login()
        user = User.authenticate("khangnx", "123456")
        session[:user_id] = user.id
    end
end