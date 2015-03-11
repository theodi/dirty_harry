module DirtyHarry
  class Validation
    include HTTParty

    attr_accessor :csv
    base_uri 'http://csvlint.io'

    def initialize(csv)
      @csv = csv
    end

    ["url", "source", "state"].each do |k|
      define_method(k.to_sym) do
        result[k]
      end
    end

    def badge
      "#{url}.svg"
    end

    private

      def result
        @response ||= JSON.parse(package)
        @response["package"]["validations"].first
      end

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
