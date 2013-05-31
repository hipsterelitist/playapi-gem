require 'playapi/utils'
require 'playapi/identity'

module Playapi
	class Entity < Playapi::Identity
		extend Playapi::Utils

		class << self

			def get(id)
				url = "api/v2/entities/#{id}"
				get_object(:get, "entity", url)
			end

			def create(opts)
				url = "api/v2/entities"
				get_object(:get, "entity", url, {:entity => opts})
			end

			def update(id, opts)
				url = "api/v2/entities/#{id}"
				get_object(:put, "entity", url, {:entity => opts})
			end

		end

	end
end