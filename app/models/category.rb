class Category < ApplicationRecord
    has_many :category_attachments
    accepts_nested_attributes_for :category_attachments #cho phép lưu bản ghi của đối tượng thông qua đối tượng cha của nó.
end
