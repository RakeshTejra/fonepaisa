module Fonepaisa
  class Configuration
    attr_accessor :api_key, :salt

    def initialize
      @api_key = nil
      @salt = nil
    end

    def api_key!
      api_key || raise(FonepaisaError, 'No api key specified.')
    end

    def salt!
      salt || raise(FonepaisaError, 'No salt specified.')
    end
  end
end
