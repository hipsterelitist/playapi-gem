require 'playapi/utils'
require 'playapi/validation/instapic'

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

			# Create a specific interaction for your campaign
			def classed_interaction(type, opts)
				url = "api/v2/interactions"
				validator = "Playapi::Validation::#{type.capitalize}".split("::").inject(Module) {|acc, val| acc.const_get(val)}
				validator.validate(opts)
				get_object(:post, "interaction", url, {:interaction => opts, :type => type})
			end

		end

	end
end