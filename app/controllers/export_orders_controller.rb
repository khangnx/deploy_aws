
# require "#{Rails.root}/app/services/export_csv_service.rb"
class ExportOrdersController < ApplicationController
    def index
        csv = ExportCsvService.new Order.all, Order::CSV_ATTRIBUTES
        respond_to do |format|
            format.csv { send_data csv.perform, :file_name => "order_list.csv" }
        end
    end
end
