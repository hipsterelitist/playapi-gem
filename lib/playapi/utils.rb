module Playapi
  module Utils
  	class << self
  		def hi
  			return true
  		end
  	end

  	private

  		def get_object(method, key, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options)
  			if res.status == 200
  				res.body[key].collect{|y| memo = y.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo};eval "#{memo[:type]}.new(#{memo})"}
  			else
          errors = res.body["errors"]
  				raise "Error returned: #{res.status} #{errors}"
  			end
  		end

  		def get_objects(method, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options)
  			if res.status == 200
  				res.body[key]
  			else
  				raise "Error returned: #{res.status}"
  			end
  		end

  end
end