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

end
