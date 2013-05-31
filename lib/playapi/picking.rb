require 'playapi/utils'
require 'playapi/feature'

module Playapi
	class Picking < Playapi::Feature
		extend Playapi::Utils
		attr_reader :target_features, :target_class

		# gets a set of interactions from a picking feature on playapi
		def get_set(set_size=2, opts={})
			url = "api/v2/picks/#{id}"
			# public and private don't matter since you can use send... :/
			self.class.send(:get_objects, :get, "results", url, opts.merge!(set_size: set_size))
		end

	end
end