module Cochimetl
  class WebServiceClient
    attr_reader :exchange_rate
     
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
      fetch_exchange_rates
    end

    def client_operations
      @client.operations
    end

    def exchange(currency)
      fetch_exchange_rates if Date.today.to_s != exchange_rate_time_period
      @exchange_rate[currency]
    end

    def supported_currencies
      SUPPORTED_CURRENCIES.keys
    end

    private

    def fetch_exchange_rates
      @exchange_rate = {}
      SUPPORTED_CURRENCIES.each {|key, value| @exchange_rate[key] = process_exchange_rate(value)}
      @exchange_rate
    end

    def process_banxico_xml_doc
      exchange_response = @client.call(:tipos_de_cambio_banxico)

      Nokogiri::XML(exchange_response.body[:tipos_de_cambio_banxico_response][:result])
    end 

    def process_exchange_rate(currency_id)
      return 1.0 if currency_id == "0"
      exchange_object = process_banxico_xml_doc.search("[IDSERIE=#{currency_id}]").children[1].to_h

      set_exchange_rate_time_period(exchange_object["TIME_PERIOD"])
      exchange_object["OBS_VALUE"].to_f
    end

    def set_exchange_rate_time_period(time_period)
      @exchange_rate_time_period = time_period
    end

    def exchange_rate_time_period
      @exchange_rate_time_period
    end
  end
end
