require 'faraday'
require 'faraday_middleware'
require 'playapi/configurable'
require 'playapi/client'
require 'playapi/entity'
require 'playapi/interaction'
require 'playapi/feature'
require 'playapi/campaign'
require 'playapi/visual'
require 'playapi/utils'
require 'playapi/instapic'
require 'playapi/checkin'
require 'playapi/custom'
require 'playapi/tweet'
require 'playapi/twitter_scraper'
require 'playapi/instagrabber'
require 'playapi/foursquare'
require 'playapi/picking'
require 'playapi/voting'
require 'playapi/snapchatter'
require 'playapi/snap'
require 'playapi/account'
require 'playapi/vine'
require 'playapi/vine_scraper'


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