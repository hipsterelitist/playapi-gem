module Playapi
	class Snapchatter < Playapi::Feature
		attr_reader :username, :password

		def send_snapchat(names=[], url='', opts={})
			# awaiting finalization of end point
			url = "/api/v2/snapchatter/#{id}/send_snapchat"
			self.class.send(:get_objects, :post, "results", opts.merge!(usernames: names, source: url))
		end
	end
end