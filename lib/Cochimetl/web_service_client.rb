module Cochimetl
  class WebServiceClient
    BANXICO_WS_URL = "http://www.banxico.org.mx/DgieWSWeb/DgieWS?WSDL".freeze

    def initialize 
      @client = Savon.client(wsdl: BANXICO_WS_URL)
    end

    def client_operations
      @client.operations
    end

    def exchange_rate(currency_id)
      response = @client.call(:tipos_de_cambio_banxico)
      doc = Nokogiri::XML(response.body[:tipos_de_cambio_banxico_response][:result])
      result = doc.search("[IDSERIE=#{currency_id}]")
      value = result.css("*").first.at_xpath("//bm:Obs").attributes["OBS_VALUE"].value
      value.to_f
    end
  end
end
