
require 'faraday'
require 'json'

module BmApiRuby
 class Client
   PATH = '/members/login'

   def initialize(args = {})
     data = {email: args[:email], password: args[:password]}
     response = Faraday.post("#{API_URL}/#{PATH}", data)
     attributes = JSON.parse(response.body)
     @token = attributes['api_token']
   end
 end
end
