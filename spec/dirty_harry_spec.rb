require 'spec_helper'

describe "DirtyHarry::Validation" do

  it "sets the correct variables on initialization" do
    url = "http://www.example.com/example.csv"
    csv = DirtyHarry::Validation.new(url)

    expect(csv.url).to eq(url)
  end

end
