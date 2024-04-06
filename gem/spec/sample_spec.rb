require_relative "../lib/sample"
RSpec.describe Sample do
  it "has a version number" do
    expect(Sample::VERSION).not_to be nil
  end

  it "hello test" do
    expect(Sample.hello).to eq("Hello")
  end
end
