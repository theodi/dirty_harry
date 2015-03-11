require 'spec_helper'

describe "DirtyHarry::Validation" do

  before(:each) do
    @csv = "http://www.example.com/example.csv"
    @stub = stub_request(:post, "http://csvlint.io/package.json").
      with(query: {urls: [@csv]}).to_return(body: File.open(File.join("spec", "fixtures", "response.json")))

    stub_request(:get, "http://csvlint.io/package/5500513863737643690d0000").
        to_return(body: File.read(File.join(File.dirname(__FILE__), "fixtures", "package.json")),
                  headers: {"Content-Type" => "application/json"})
  end

  it "sets the correct variables on initialization" do
    csv = DirtyHarry::Validation.new(@csv)

    expect(csv.csv).to eq(@csv)
  end

  it "posts to csvlint" do
    csv = DirtyHarry::Validation.new(@csv)
    csv.send(:response)

    expect(@stub).to have_been_requested.once
  end

  it "returns a url for a validation" do
    csv = DirtyHarry::Validation.new(@csv)

    expect(csv.send(:package_url)).to eq("http://csvlint.io/package/5500513863737643690d0000")
  end

  it "waits for the package to be created" do
    stub_request(:get, "http://csvlint.io/package/5500513863737643690d0000").
        to_return({status: 404}).times(2).then.
        to_return(body: File.read(File.join(File.dirname(__FILE__), "fixtures", "package.json")),
                  headers: {"Content-Type" => "application/json"})

    csv = DirtyHarry::Validation.new(@csv)

    expect(csv.url).to eq("http://csvlint.io/validation/53566ef96373767abf010000")
    expect(csv.source).to eq("http://www.example.com/example.csv")
    expect(csv.state).to eq("invalid")
  end

  it "returns a badge" do
    stub_request(:get, "http://csvlint.io/package/5500513863737643690d0000").
        to_return(body: File.read(File.join(File.dirname(__FILE__), "fixtures", "package.json")),
                  headers: {"Content-Type" => "application/json"})

    csv = DirtyHarry::Validation.new(@csv)

    expect(csv.badge).to eq("http://csvlint.io/validation/53566ef96373767abf010000.svg")
  end

end
