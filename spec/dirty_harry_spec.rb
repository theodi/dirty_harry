require 'spec_helper'

describe "DirtyHarry::Validation" do

  it "sets the correct variables on initialization" do
    url = "http://www.example.com/example.csv"
    csv = DirtyHarry::Validation.new(url)

    expect(csv.url).to eq(url)
  end

  it "posts to csvlint" do
    url = "http://www.example.com/example.csv"

    stub = stub_request(:post, "http://csvlint.io/package.json").
      with(query: {urls: [url]}).to_return(body: File.open(File.join("spec", "fixtures", "response.json")))

    csv = DirtyHarry::Validation.new(url)
    csv.response

    expect(stub).to have_been_requested.once
  end

  it "returns a url for a validation" do
    url = "http://www.example.com/example.csv"

    stub = stub_request(:post, "http://csvlint.io/package.json").
      with(query: {urls: [url]}).to_return(body: File.open(File.join("spec", "fixtures", "response.json")))

    csv = DirtyHarry::Validation.new(url)

    expect(csv.package_url).to eq("http://csvlint.io/package/5500513863737643690d0000")
  end

  it "waits for the package to be created" do
    url = "http://www.example.com/example.csv"

    stub_request(:post, "http://csvlint.io/package.json").
      with(query: {urls: [url]}).to_return(body: File.open(File.join("spec", "fixtures", "response.json")))

    stub_request(:get, "http://csvlint.io/package/5500513863737643690d0000").
        to_return({status: 404}).times(2).then.
        to_return(body: File.read(File.join(File.dirname(__FILE__), "fixtures", "package.json")),
                  headers: {"Content-Type" => "application/json"})

    csv = DirtyHarry::Validation.new(url)
    result = csv.result

    expect(result["url"]).to eq("http://csvlint.io/validation/53566ef96373767abf010000")
    expect(result["source"]).to eq("http://www.example.com/example.csv")
    expect(result["state"]).to eq("invalid")
  end

end
