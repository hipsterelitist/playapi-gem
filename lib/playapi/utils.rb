module Playapi
  module Utils
  	class << self
  		def hi
  			return true
  		end
  	end

  	private

  		def get_object(method, key, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options).body
  			res[key]
  		end

  		def get_objects(method, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options).body
  		end

  end
end