# fonePaisa [![Circle CI](https://circleci.com/gh/RakeshTejra/fonepaisa.svg?style=svg)](https://circleci.com/gh/RakeshTejra/fonepaisa)

This gem interact with fonePaisa payment gateway APIs. Currently the gem covers only Payment Request URL API.

## Getting started

### Installation

Add the gem to your `Gemfile`:

```ruby
gem 'fonepaisa'
```

and run:

```
bundle install
```

Or install it by yourself:

```
gem install fonepaisa
```

### Configuration

Add below configuration in initializer

``` ruby
# config/initializers/fonepaisa.rb

Fonepaisa.configure do |config|
  config.api_key = 'Your fonePaisa API Key'
  config.salt = 'Your fonePaisa Salt'
end
```

### Uses

##### GET PAYMENT REQUEST URL

fonePaisa provides an API which returns a unique payment page URL on your merchant server in response which can be used in any browser to show the payment selection page and complete the transaction.

```ruby
request_params = {
  amount: 100,
  currency: 'INR',
  mode: 'Live,
  ...
}

response = Fonepaisa::PaymentRequestURL.new(request_params).execute
```
In response you will get a payment execution URL in case of success. Refer the fonePaisa technical integration guide for complete list of parameters to be posted in payment request.

To validate the response received from fonePaisa

```ruby
Fonepaisa::Client.new(response_params).response_valid?
```

## Contributing

Read the [Contributing Guidelines](CONTRIBUTING.md) and open a Pull Request.
