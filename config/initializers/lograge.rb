# config/initializers/lograge.rb
require 'lograge/sql/extension'
Rails.application.configure do
  config.action_dispatch.cookies_serializer = :json
  config.lograge.base_controller_class = 'ActionController::Base'
  config.lograge.enable = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.logger = ActiveSupport::Logger.new(STDOUT)
  config.colorize_logging = false
  config.log_level = :debug 
  config.lograge.custom_options = lambda do |event|
    { :params => event.payload[:params],
      :level => event.payload[:level],
      :time => Time.now 
    }
  #   config.lograge.ignore_actions = [
  #   'ActiveStorage::DiskController#show',
  #   'ActiveStorage::BlobsController#show',
  #   'ActiveStorage::RepresentationsController#show'
  # ]
  config.lograge.keep_original_rails_log = true
  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
  end
end
