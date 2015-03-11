module DirtyHarry
  class Validation
    include HTTParty

    attr_accessor :urls
    base_uri 'http://csvlint.io'

    def initialize(urls)
      @urls = [urls].flatten
    end

  end
end
