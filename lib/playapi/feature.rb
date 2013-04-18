require 'playapi/utils'

module Playapi
	class Feature
		extend Playapi::Utils

		class << self

			def list
				url = "api/v2/features"
				get_object(:get, "features", url)
			end

			def get(id)
				url = "api/v2/features/#{id}"
				get_object(:get, "feature", url)
			end

			def create(opts)
				url = "api/v2/features"
				get_object(:post, "feature", url, {:feature => opts})
			end

			def update(id, opts)
				url = "api/v2/features/#{id}"
				get_object(:put, "feature", url, {:feature => opts})
			end

		end

	end
end