require 'faraday'
require 'faraday_middleware'
require 'hashie'
require 'playapi/configurable'
require 'playapi/client'
require 'playapi/entity'
require 'playapi/utils'
require 'playapi/interaction'
require 'playapi/campaign'

module Playapi
	class << self
		include Playapi::Configurable

		def client
      @client = Playapi::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client
    end

	end
end

Playapi.reset! # sets default values