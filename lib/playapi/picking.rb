module Playapi
	class Picking < Playapi::Feature
		attr_reader :target_features, :target_class

		def get_set(set_size=2, opts={})
			url = "api/v2/picking/#{id}"
			get_object(url, opts.merge!(set_size))
		end

	end
end