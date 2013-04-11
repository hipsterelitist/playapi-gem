require 'faraday'
require 'faraday_middleware'

module Playapi
	require 'playapi/client'

	class << self
		FIELDS = [:client_id, :client_secret]
		attr_accessor(*FIELDS)
		def client
			#@client = p
		end

		def get_client
			Playapi::Client.new
		end
	end
end