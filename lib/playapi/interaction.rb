require 'playapi/utils'

module Playapi
	class Interaction
		extend Playapi::Utils

		class << self

			def get(id)
				url = "api/v2/interactions/#{id}"
				get_object(:get, "interaction", url)
			end

			def create(opts)
				url = "api/v2/interactions"
				get_object(:post, "interaction", url, {:interaction => opts})
			end

			def update(id, opts)
				url = "api/v2/interactions/#{id}"
				get_object(:put, "interaction", url, {:interaction => opts})
			end

		end

	end
end