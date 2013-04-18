require 'playapi/utils'

module Playapi
	class Campaign
		extend Playapi::Utils

		# stub this out for now, it will probably do crazy stuff when we integrate campaign controls.

		class << self

			# Get the primary campaign for which you are currently authorized, one will be able to
			# pass the name of the campaign, if your credentials are good for multiple campaigns...
			# but not yet.
			def get(campaign_name = "index")
				url = "api/v2/campaigns/"
				#url += "/#{campaign_name}" unless campaign_name == nil
				get_object(:get, "campaign", url)
			end

			# Get interactions for a campaign, optional paramaters include
			# Optional params hash (opts)
			# :sort=STRING 		(Valid options are: leaders, newest, oldest)
			# :approved=BOOL	(Show only approved interactions)
			# :pending=BOOL		(Show only pending (unapproved) interactions)
			# :limit=INTEGER 	(Limit to a number of entries, defaults to 10)
			# :page=INTEGER		(Determines the offset for limit, defaults to 1)
			# :type=STRING 		(Valid options are Instapic, Tweet, Checkin)
			def get_interactions(campaign_name, opts = {})
				#* This could just called Playapi::Interaction.list....
				url = "api/v2/campaigns/#{campaign_name}/interactions"
				get_object(:get, "interactions", url, opts).interactions
			end

			# Get interactions with the most points (highest score) for a campaign
			# Optional params hash (opts)
			# :limit=INTEGER 	(Limit to a number of entries, defaults to 10)
			# :page=INTEGER		(Determines the offset for limit, defaults to 1)
			# :type=STRING 		(Valid options are Instapic, Tweet, Checkin)
			def leaders(campaign_name, opts = {})
				#* This could just call Playapi::Interactions.list with most points params...
				url = "api/v2/campaigns/#{campaign_name}/leaders"
				get_object(:get, "results", url, opts)
			end

			def create(opts)
				#raise "WE DON'T MAKE CAMPAIGNS YET"
				#url = "api/v2/campaigns"
				#get_object(:get, "interaction", url, {:entity => opts})
			end

			def update(name, opts)
				#raise "WE DON'T UPDATE CAMPAIGNS YET"
				#url = "api/v2/campaigns/#{id}"
				#get_object(:put, "campaign", url, {:entity => opts})
			end

		end

	end
end