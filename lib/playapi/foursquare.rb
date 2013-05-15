module Playapi
	class Foursquare < Playapi::Feature
		attr_reader :authenticated_venues, :client_id, :client_secret, :oauth_token, :push_secret

	end
end