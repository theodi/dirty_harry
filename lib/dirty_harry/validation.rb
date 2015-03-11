module DirtyHarry
  class Validation
    include HTTParty

    attr_accessor :urls
    base_uri 'http://csvlint.io'

    def initialize(urls)
      @urls = [urls].flatten
    end

    def validations
      response = JSON.parse(package)
      response["package"]["validations"]
    end

    def response
      JSON.parse(self.class.post("/package.json", query: { urls: @urls }).body)
    end

    def package_url
      response["package"]["url"]
    end

    def package
      response = nil
      until !response.nil?
        response = self.class.get(package_url).body
      end
      response
    end

  end
end
