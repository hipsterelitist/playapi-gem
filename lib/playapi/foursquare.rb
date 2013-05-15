module Playapi
	class Foursquare < Playapi::Feature
		attr_reader :authenticated_venues, :push_secret

	end
end