module Fonepaisa
  class PaymentRequestURL < Client
    def execute
      hash_key = secure_hash_key(request_params)

      response = RestClient.post(
        "#{BASE_URL}/getpaymentrequesturl",
        request_params.merge(hash: hash_key)
      )

      response.body
    end
  end
end
