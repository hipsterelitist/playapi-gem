require 'playapi/utils'
require 'playapi/identity'


module Playapi
	class Account < Playapi::Identity
		extend Playapi::Utils
		attr_reader :service_name, :service_id

		def push
			self.attrs = Playapi::Account.update(id, @attrs).attrs
		end

		class << self

			def list
				url = "api/v2/accounts"
				get_objects(:get, "accounts", url)
			end

			def get(id)
				url = "api/v2/accounts/#{id}"
				get_object(:get, "account", url)
			end

			def update(id, opts)
				url = "api/v2/accounts/#{id}"
				get_object(:put, "account", url, {:account => opts})
			end

		end

	end
end