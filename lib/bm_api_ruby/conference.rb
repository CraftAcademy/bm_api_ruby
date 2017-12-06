require 'open-uri'
module BmApiRuby
  class Conference
    attr_accessor :id, :title, :purpose, :start_time, :duration, :conference_address

    PATH = '/conferences'


    def self.list(client)
      response = open("#{API_URL}#{PATH}", {'api-key' => client.token}).read
      binding.pry
      JSON.parse(response)['conferances']
    end
  end
end
