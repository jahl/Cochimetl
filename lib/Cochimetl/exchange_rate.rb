module Cochimetl
  class ExchangeRate
    attr_accessor :currency
    attr_accessor :value

    def initialize(value, currency)
      @value = value
      self.from(currency)
    end

    def to(new_currency)
      previous_currency = @currency
      @currency = new_currency
      @value *= (Cochimetl.client.exchange(previous_currency) / 1)
      @value /= Cochimetl.client.exchange(@currency)
    end

    def from(new_currency)
      @currency = new_currency
    end

    def +(value)
      @value += value
    end

    def -(value)
      @value -= value
    end

    def *(value)
      @value *= value
    end

    def /(value)
      @value /= value
    end
  end
end
