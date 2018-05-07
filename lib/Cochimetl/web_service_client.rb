module Cochimetl
  class WebServiceClient
    attr_accessor :exchange_rate
    attr_accessor :time_period
    attr_accessor :doc
     
    BANXICO_WS_URL = "http://www.banxico.org.mx/DgieWSWeb/DgieWS?WSDL".freeze
    SUPPORTED_CURRENCIES = {
      mxn: "0",
      usd: "SF43718",
      eur: "SF46410",
      jpy: "SF46406",
      gbp: "SF46407",
      cad: "SF60632"
    }.freeze
    
    def initialize 
      @client = Savon.client(wsdl: BANXICO_WS_URL)
      banxico_xml_doc
      fetch_exchange_rates
    end

    def client_operations
      @client.operations
    end

    def exchange(currency)
      fetch_exchange_rates if Date.today.to_s != @time_period
      @exchange_rate[currency]
    end

    def fetch_exchange_rates
      @exchange_rate = {}
      SUPPORTED_CURRENCIES.each {|key, value| @exchange_rate[key] = process_exchange_rate(value)}
      @exchange_rate
    end

    def banxico_xml_doc
      @exchange_response ||=@client.call(:tipos_de_cambio_banxico)
      @doc ||= Nokogiri::XML(@exchange_response.body[:tipos_de_cambio_banxico_response][:result])
    end 

    def process_exchange_rate(currency_id)
      return 1.0 if currency_id == "0"
      
      exchange_object = banxico_xml_doc.search("[IDSERIE=#{currency_id}]").children[1].to_h

      @time_period = exchange_object["TIME_PERIOD"]
      exchange_object["OBS_VALUE"].to_f
    end
  end
end
