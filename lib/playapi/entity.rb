module Playapi
	class Entity
		#include Client

		class << self

			def get(id)
				url = "api/v2/entities/#{id}"
				method = "get"
				res = @connection.get do |req|
					req.url url
				end
				return_error_or_response(res)
			end

			def create(opts)
				url = "api/v2/entities"
				params = opts
				conn = connection
				conn.params.merge!(params)
				conn.post do |req|
					req.url url
				end	
				return_error_or_response(res)
			end

			def update(id)
				url = "api/v2/entities/#{id}"
				method = "put"
				res = connection.put do |req|
					req.url url
				end
				return_error_or_response(res)
			end

		end

	end
end