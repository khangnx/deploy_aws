FactoryBot.define do
    factory :user do
        sequence(:name) { |n| "#{n}khangnx" }
        # name {"khangnx"}
        hashed_password {"31ad13d3aa272c586d77ddd863d298b2c7ed7c488994a7bbbe373180ddc57d94"}
        salt {"853600.08778741363391418"}
        email {"vfa.khangnx@gmail.com"}
    end
end