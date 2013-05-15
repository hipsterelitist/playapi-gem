module Playapi
  module Configurable
    extend Forwardable
    attr_writer :client_id, :client_secret, :oauth_token
    attr_accessor :endpoint, :connection_options, :identity_map, :connection_middleware
    def_delegator :options, :hash


    DEFAULT_CONNECTION_MIDDLEWARE = [
      Faraday::Request::Multipart,
      Faraday::Request::UrlEncoded,
      FaradayMiddleware::ParseJson
    ]

    class << self

      def keys
        @keys ||= [
          :client_id,
          :client_secret,
          :oauth_token,
          :endpoint,
          :connection_options,
          :identity_map,
          :connection_middleware,
        ]
      end

    end

    # Convenience method to allow configuration options to be set in a block
    #
    # @raise [Twitter::Error::ConfigurationError] Error is raised when supplied
    #   twitter credentials are not a String or Symbol.
    def configure
      yield self
      validate_credential_type!
      self
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    def reset!
      defaultz = {client_id: "foo", client_secret: "foo", oauth_token: "foo", endpoint: "http://pre-playapi-dev.herokuapp.com"}
      # we can probably chuck conn_ops
      conn_ops = {
        :connection_options => {:headers => {:accept => "application/json", :user_agent => "PlayAPI Gem 0.1.1"}, 
          :ssl => {:verify => false}}
      }
      #defaultz.merge!(conn_ops)

      defaultz.merge!(:connection_middleware => DEFAULT_CONNECTION_MIDDLEWARE)

      Playapi::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", defaultz[key])
      end
      self
    end
    alias setup reset!

  private

    # @return [Hash]
    def credentials
      {
        :client_id => @client_id,
        :client_secret => @client_secret,
        :token => @oauth_token,
      }
    end

    # @return [Hash]
    def options
      Hash[Playapi::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

    # Ensures that all credentials set during configuration are of a
    # valid type. Valid types are String and Symbol.
    def validate_credential_type!
      credentials.each do |credential, value|
        next if value.nil?

        unless value.is_a?(String) || value.is_a?(Symbol)
          raise "Invalid #{credential} specified: #{value} must be a string or symbol."
        end
      end
    end

  end
end