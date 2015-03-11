module DirtyHarry
  class Validation
    include HTTParty

    attr_accessor :csv
    base_uri 'http://csvlint.io'

    def initialize(csv)
      @csv = csv
    end

    def result
      response = JSON.parse(package)
      response["package"]["validations"].first
    end

    private

      def response
        JSON.parse(self.class.post("/package.json", query: { urls: [@csv] }).body)
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
