
require 'faraday'
require 'json'
require 'pry'

module BmApiRuby
 class Client
   PATH = '/members/login'
   attr_accessor :token

   def initialize(args = {})
     @token = set_token(args)
   end

   private
   def set_token(args)
     if args[:token]
       return args[:token]
     else
       data = {email: args[:email], password: args[:password]}
       response = Faraday.post("#{API_URL}/#{PATH}", data)
       attributes = JSON.parse(response.body)
       attributes['api_token']
     end
   end
 end
end
