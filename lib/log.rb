# lib/log.rb

# frozen_string_literal: true

# Adds logger Log.*level* methods
module Log
    extend self
  
    [:debug, :info, :warn, :error, :fatal, :unknown].each do |severity|
      define_method severity do |message, params = {}|
        raise ArgumentError, "Hash is expected as 'params'" unless params.is_a?(Hash)
        logger.public_send(severity, {
          m: message
        }.merge(params).to_json)
      end
    end
  
    private
  
    def logger
      Lograge.logger
    end
  end