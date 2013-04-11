module Playapi
	class Client

		DEFAULT_CONNECTION_MIDDLEWARE = [
      Faraday::Request::Multipart,
      Faraday::Request::UrlEncoded,
      FaradayMiddleware::Mashify,
      FaradayMiddleware::ParseJson
    ]

		def initialize(options={})
			@client_id = options[:client_id]
			@client_secret = options[:client_secret]
			@oauth_token = options[:oauth_token]
			@ssl = options[:ssl] || false
			@connection_middleware = options[:connection_middleware] || []
			@connection_middleware += DEFAULT_CONNECTION_MIDDLEWARE
		end

		def ssl
			@ssl || false
		end

		def play_url
			"https://pre-playapi-dev.herokuapp.com/"
		end

		def connection
			params = {}
			params[:client_id] = @client_id
			params[:client_secret] = @client_secret
			params[:token] = @oauth_token

			@connection ||= Faraday::Connection.new(:url => play_url, 
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

		def return_error_or_response(response)
			if response.status == 200
				response_body
			else
				raise "Something went wrong."
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