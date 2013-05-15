require 'playapi/utils'
require 'playapi/feature'

module Playapi
	class Picking < Playapi::Feature
		extend Playapi::Utils
		attr_reader :target_features, :target_class

		def get_set(set_size=2, opts={})
			url = "api/v2/picks/#{id}"
			self.class.send(:get_objects, :get, "results", url, opts.merge!(set_size: set_size))
		end

	end
end