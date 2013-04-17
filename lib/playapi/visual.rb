require 'playapi/utils'

module Playapi
	class Visual
		extend Playapi::Utils

		class << self

			def get_all
				url "api/v2/visuals"
				get_object(:get, "visuals", url)
			end

			def get(id)
				url = "api/v2/visuals/#{id}"
				get_object(:get, "visual", url)
			end

			def create(opts)
				url = "api/v2/visuals"
				get_object(:post, "visual", url, {:visual => opts})
			end

			def update(id, opts)
				url = "api/v2/visuals/#{id}"
				get_object(:put, "visual", url, {:visual => opts})
			end

		end

	end
end