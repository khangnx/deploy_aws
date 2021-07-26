class Product < ApplicationRecord
    validates :title, :description, :image_url, :presence => true
    validates :price, :numericality => {:greater_than_or_equal_to => 3.0}
    validates :title, :uniqueness => true
    validates :image_url, :format => {:with => %r{\.(gif|jpg|png)\Z}i, :message => 'Only accept image with .gif, .png,. jpg'}
    has_many :line_items
    before_destroy :check_if_has_line_item
    def check_if_has_line_item
        if line_items.empty?
            return true
        else
            errors.add(:base, "This product has Line Items")
            return false
        end
    end
end