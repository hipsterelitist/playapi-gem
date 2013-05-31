require 'playapi/utils'
require 'playapi/validation/feature'
require 'playapi/validation/instagrabber'
require 'playapi/validation/twitter_scraper'
require 'playapi/validation/picking'
require 'playapi/identity'


module Playapi
	class Feature < Playapi::Identity
		extend Playapi::Utils
		attr_reader :id, :campaign_id, :name, :live, :default_points, :attrs

		def interactions
			Playapi::Interaction.by_feature(id)
		end

		def push
			Playapi::Feature.update(id, @attrs)
		end

		def destroy
			Playapi::Feature.destroy(id)
		end

		def campaign
			Playapi::Campaign.get(@attrs["campaign_id"])
		end

		class << self
			# Get a list of features for auth campaign
			# TODO: add filters and options
			def list
				url = "api/v2/features"
				get_objects(:get, "features", url)
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
				#validator = "Playapi::Validation::#{type.split('_').map {|w| w.capitalize}.join}".split("::").inject(Module) {|acc, val| acc.const_get(val)}
				#validator.validate(opts)
				get_object(:post, "feature", url, {:feature => opts, :type => type})
			end

			# Update a feature with the given id
			# 		See create for field details.

			def update(id, opts)
				url = "api/v2/features/#{id}"
				get_object(:put, "feature", url, {:feature => opts})
			end

			# destroy a feature
			def destroy(id)
				url = "api/v2/features/#{id}"
				get_object(:delete, "feature", url)
			end
			# pass in a hash of options to find things, options include: type and name
			# returns an array
			# name=String
			# type=String
			def find_by_facet(opts)
				url = "api/v2/features/facet"
				get_objects(:get, :features, url, opts)
			end

		end

	end
end