require 'playapi/utils'
require 'playapi/validation/instapic'
require 'playapi/validation/tweet'
require 'playapi/validation/custom'



module Playapi
	class Interaction
		extend Playapi::Utils

		class << self

			# Get interactions for a campaign, optional paramaters include
			# Optional params hash (opts)
			# :sort=STRING 		(Valid options are: leaders, newest, oldest)
			# :approved=BOOL	(Show only approved interactions)
			# :pending=BOOL		(Show only pending (unapproved) interactions)
			# :limit=INTEGER 	(Limit to a number of entries, defaults to 10)
			# :page=INTEGER		(Determines the offset for limit, defaults to 1)
			# :type=STRING 		(Valid options are Instapic, Tweet, Checkin)
			def list
				url = "api/v2/interactions"
				get_object(:get, "interactions", url)
			end

			# Get an interaction with the given id
			def get(id)
				url = "api/v2/interactions/#{id}"
				get_object(:get, "interaction", url)
			end

			# Create a custom interaction for your campaign
			# Optional fields (opts)
			# :entity_id=STRING (Playapi Entity ID - ONLY USE THIS IF YOU HAVE A PLAYAPI PROVIDED ENTITY_ID)
			# :points=Float (Points for this interaction)
			# WILL BE DEPRECATED IN VERSION 0.0.2, please use classed_interaction! NOT A JOKE
			def create(opts)
				url = "api/v2/interactions"
				get_object(:post, "interaction", url, {:interaction => opts})
			end

			# Update a specific interaction for your campaign
			def update(id, opts)
				url = "api/v2/interactions/#{id}"
				get_object(:put, "interaction", url, {:interaction => opts})
			end

			def destroy(id)
				url = "api/v2/interactions/#{id}"
				get_object(:delete, "interaction", url)
			end

			# pass in a hash of options to find things, currently the only one that is applicable is content_id
			# returns an array
			# content_id=String
			def find_by_facet(opts)
				url = "api/v2/interactions/facet"
				get_object(:get, :interactions, url, opts)
			end

			# Create a classed interaction for authed campaign
			#
			# Type is a string corresponds to a Playapi Interaction class
			#
			# Valid options are:
			# 		:type=STRING (Valid Options: Custom, Instapic, Tweet)
			#  			Instapic(:content_id, :)
			# 
			#
			# ID VALUES FOR THIS CLASS ARE PROVIDED BY PLAYAPI AND MUST MATCH !!!
			# IF THE ID VALUES DON'T MATCH, YOUR GONNA HAVE A BAD TIME !!!
			#
			# Required fields for ALL types (opts)
			# 	:feature_id=STRING 	(Playapi Feature ID )
			# 	:points=FLOAT			(Points for this interaction)
			#   :content_id=STRING 	(3rd party (twitter status_id, etc) id from which content was sourced)
			#
			# Required fields for Instapics
			# 	:asset_url=STRING 	(URL of the instagram image)
			#
			# Required fields for Tweet
			#   :text=STRING 			 	(Text from a Tweet)

			def classed_interaction(type="Custom", opts = {})
				url = "api/v2/interactions"
				validator = "Playapi::Validation::#{type.split('_').map {|w| w.capitalize}.join}".split("::").inject(Module) {|acc, val| acc.const_get(val)}
				validator.validate(opts)
				get_object(:post, "interaction", url, {:interaction => opts, :type => type})
			end

		end

	end
end