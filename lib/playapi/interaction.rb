require 'playapi/utils'
require 'playapi/validation/instapic'

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

			def destroy(id)
				url = "api/v2/interactions/#{id}"
				get_object(:delete, "interaction", url)
			end

			def classed_interaction(type, opts)
				url = "api/v2/interactions"
				validator = "Playapi::Validation::#{type.capitalize}".split("::").inject(Module) {|acc, val| acc.const_get(val)}
				validator.validate(opts)
				get_object(:post, "interaction", url, {:interaction => opts, :type => type})
			end

		end

	end
end