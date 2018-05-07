require "Cochimetl"
require 'savon'
require 'nokogiri'

module Cochimetl
  @@client = Cochimetl::WebServiceClient.new

  def self.client
    @@client
  end

  def self.new(value, currency)
    Cochimetl::ExchangeRate.new(value, currency)
  end
end
