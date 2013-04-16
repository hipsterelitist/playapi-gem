require 'faraday'

module Playapi
	class Client

		def initialize(options={})
			Playapi::Configurable.keys.each do |key|
				instance_variable_set(:"@#{key}", options[key] || Playapi.instance_variable_get(:"@#{key}"))
			end
		end

		def connection
			params = {}
			params[:client_id] = @client_id
			params[:client_secret] = @client_secret
			params[:token] = @oauth_token


			@connection ||= Faraday::Connection.new(:url => @endpoint, 
					:ssl => @ssl,
					:params => params,
					:headers => default_headers
				) do |builder|
				@connection_middleware.each do |mw|
						builder.use *mw
				end
				builder.adapter Faraday.default_adapter
			end
		end

		private

			def default_headers
				headers = {
					:accept => "application/json",
					:user_agent => "PlayAPI Gem 0.0.1"
				}
			end

	end
end