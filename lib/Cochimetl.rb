require 'savon'
require 'nokogiri'

require "Cochimetl/exchange_rate"
require "Cochimetl/web_service_client"
require "Cochimetl/version"

module Cochimetl
  @@client = Cochimetl::WebServiceClient.new

  def self.client
    @@client
  end

  def self.new(value, currency)
    raise ArgumentError, "Currency '#{currency}' is not supported." unless Cochimetl.currencies.include? currency
    raise ArgumentError, "'#{value}' is not a numeric value." unless value.is_a? Numeric
    Cochimetl::ExchangeRate.new(value, currency)
  end

  def self.currencies
    @@client.supported_currencies
  end
end
