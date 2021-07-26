class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = ['Cash on delivery', 'Paypal', 'Bank Card']
  validates :name, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  # Khai báo các field export trong model: fro export csv
  CSV_ATTRIBUTES = %w[name address email pay_type].freeze
  # đọc chi field import file trong view
  attr_accessor :file

  # End khai báo các field export trong model: fro export csv

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  # create function read file csv and import
  # self là một biến đặc biệt trỏ đến đối tượng "sở hữu" mã hiện đang thực thi
  # chỉ ra hàm import_file thuôc đối tượng order, vì hàm import_file không gọi trong đối tuyong order nên pahỉ dùng self
  def self.import_file(file)
    extend_file = File.extname(file.original_filename)
    if extend_file == '.csv'
      CSV.foreach(file.path, headers: true) do |row|
        Order.create!(row.to_hash)
      end
    else
      Order.import_excel file
    end
  end

  def self.import_excel(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h #transpose dùng đề lấy column trong file excel
      create! row
    end
  end
  # open file excel
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise 'Unknown file'
    end
  end
end
