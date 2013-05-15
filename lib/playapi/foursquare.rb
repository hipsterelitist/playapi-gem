module Playapi
	class Foursquare < Playapi::Feature
		attr_accessor :authenticated_venues, :client_id, :client_secret, :oauth_token, :push_secret

		def near(coords)
			#This would be a nice function, no? Shall I add an endpoint just for location items?
		end

	end
end