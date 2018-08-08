RSpec.describe Cochimetl do
  it "has a version number" do
    expect(Cochimetl::VERSION).not_to be nil
  end

  it "creates a new exchange rate object" do
    exchange_rate = Cochimetl.new(1, :mxn)
    expect(exchange_rate).to be_a(Cochimetl::ExchangeRate)
  end

  it "tells the user the supported currencies" do
    expect(Cochimetl.currencies).to eq([:mxn, :usd, :eur, :jpy, :gbp, :cad])
  end

  it "validates for unsupported currencies" do
    expect{Cochimetl.new(1, :unsupported)}.to raise_exception(ArgumentError)
  end

  it "validates for non-numeric values " do
    expect{Cochimetl.new("a", :mxn)}.to raise_exception(ArgumentError)
  end
end
