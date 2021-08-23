FactoryBot.define do
    factory :post do
        association :user #khai báo mối qua hệ với user
        body {"This is body post"}
    end
end