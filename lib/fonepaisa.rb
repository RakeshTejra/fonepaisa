require 'fonepaisa/configuration'
require 'fonepaisa/client'
require 'fonepaisa/payment_request_url'

module Fonepaisa
  class FonepaisaError < StandardError; end

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end
  end
end
