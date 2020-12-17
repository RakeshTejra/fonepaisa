require 'digest'
require 'rest-client'

module Fonepaisa
  class Client
    attr_reader :params

    BASE_URL = 'https://api.fonepaisa.com/v2'.freeze

    def initialize(params)
      @params = params
    end

    def response_valid?
      # if hash field is nil then no need to verify response params
      return true if params[:hash].nil?

      attributes = params.dup
      attributes.delete(:hash)
      hash_key = secure_hash_key(attributes)

      hash_key == params[:hash]
    end

    private

    def secure_hash_key(attributes)
      data = Fonepaisa.configuration.salt!

      attributes.sort.to_h.each do |_key, value|
        data += "|#{value.gsub(/\s+/, ' ').strip}" unless value.nil?
      end

      Digest::SHA512.hexdigest(data).upcase
    end

    def request_params
      params.merge(
        api_key: Fonepaisa.configuration.api_key!
      )
    end
  end
end
