require 'spec_helper'

describe "DirtyHarry::Validation" do

  it "sets the correct variables on initialization" do
    url = "http://www.example.com/example.csv"
    csv = DirtyHarry::Validation.new(url)

    expect(csv.urls).to eq([url])
  end

  it "accepts multiple urls as an array" do
    urls = ["http://www.example.com/example1.csv", "http://www.example.com/example2.csv"]
    csv = DirtyHarry::Validation.new(urls)

    expect(csv.urls).to eq(urls)
  end

end
