RSpec.describe Cochimetl::WebServiceClient do
  subject { described_class.new }

  it "fetches exchange rates" do
    expect(subject.exchange(:usd)).to_not be(nil)
    expect(subject.exchange(:usd)).to be_a(Float)
    expect(subject.exchange(:eur)).to_not be(nil)
    expect(subject.exchange(:eur)).to be_a(Float)
    expect(subject.exchange(:jpy)).to_not be(nil)
    expect(subject.exchange(:jpy)).to be_a(Float)
    expect(subject.exchange(:gbp)).to_not be(nil)
    expect(subject.exchange(:gbp)).to be_a(Float)
    expect(subject.exchange(:cad)).to_not be(nil)
    expect(subject.exchange(:cad)).to be_a(Float)
  end
end
