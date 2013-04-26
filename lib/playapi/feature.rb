require 'playapi/utils'
require 'playapi/validation/feature'
require 'playapi/validation/instagrabber'
require 'playapi/validation/twitterscraper'
require 'playapi/validation/picking'


module Playapi
	class Feature
		extend Playapi::Utils

		def initialize

		end

		class << self
			# Get a list of features for auth campaign
			# TODO: add filters and options
			def list
				url = "api/v2/features"
				get_object(:get, "features", url)
			end

			# Fetch a feature by id
			def get(id)
				url = "api/v2/features/#{id}"
				get_object(:get, "feature", url)
			end

			# Create a new feature for authed campaign
			#
			# Type is a string that corresponds to a Playapi Feature class
			#
			# Valid options are:
			#  		type=STRING (Valid Options: Picking, Voting, Instagrabber, TwitterScraper, Foursquare)
			#
			# Required fields for ALL types (opts)
			# 		:name=STRING
			# 		:description=STRING
			#
			# Required fields for Instagrabber, TwitterScraper, Foursquare
			# 		:default_points=FLOAT (Default is 0)
			#
			# Required fields for Instagrabber, TwitterScraper
			# 		:hashtags=Array 		(Array of hashtags to watch)

			def create(type, opts)
				url = "api/v2/features"
				validator = "Playapi::Validation::#{type.capitalize}".split("::").inject(Module) {|acc, val| acc.const_get(val)}
				validator.validate(opts)
				get_object(:post, "feature", url, {:feature => opts})
			end

			# Update a feature with the given id
			# 		See create for field details.

			def update(id, opts)
				url = "api/v2/features/#{id}"
				get_object(:put, "feature", url, {:feature => opts})
			end

		end

	end
end