class CategoryAttachment < ApplicationRecord
    mount_uploader :attachment, AvatarUploader
    belongs_to :category
end
