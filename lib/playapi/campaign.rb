require 'playapi/utils'

module Playapi
	class Interaction
		extend Playapi::Utils

		# stub this out for now, it will probably do crazy stuff when we integrate campaign controls.

		class << self

			def get(name)
				url = "api/v2/campaigns/#{name}"
				get_object(:get, "campaign", url)
			end

			def get_interactions(campaign_name)
				url = "api/v2/campaigns/#{campaign_name}"
				get_object(:get, "campaign", url).interactions
			end

			def leaders(name, page=0)
				url = "api/v2/campaigns/#{name}"
				get_object(:get, "interactions", url)
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