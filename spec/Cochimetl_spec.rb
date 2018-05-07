RSpec.describe Cochimetl do
  it "has a version number" do
    expect(Cochimetl::VERSION).not_to be nil
  end

  it "creates a new exchange rate object" do
    exchange_rate = Cochimetl.new(1, :mxn)
    expect(exchange_rate).to be_a(Cochimetl::ExchangeRate)
  end
end
