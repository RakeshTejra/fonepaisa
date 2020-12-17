require 'fonepaisa/configuration'

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
