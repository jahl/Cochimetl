RSpec.describe Cochimetl::ExchangeRate do
  subject { described_class.new(1.0, :mxn) }

  it "saves current currency and value" do
    expect(subject.value).to equal(1.0)
    expect(subject.currency).to equal(:mxn)
  end

  it "is able to change to a new currency" do
    subject.to(:usd)
    expect(subject.currency).to equal(:usd)
  end

  it "performs a conversion of the value to the new currency" do
    subject.to(:usd)
    expect(subject.value).to_not equal(1)
  end

  it "correctly returns the amount back to it's original value" do
    subject.to(:usd)
    subject.to(:mxn)
    expect(subject.value).to equal(1.0)
  end

  it "is able to perform arithmetic operations" do
    expect(subject + 1).to equal(2.0)
    expect(subject - 1).to equal(1.0)
    expect(subject * 2).to equal(2.0)
    expect(subject / 2).to equal(1.0)
  end
end
