module Playapi
  module Utils
  	class << self
  		def hi
  			return true
  		end
  	end

  	private

  		def get_objects(method, key, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options)
  			if res.status == 200
  				res.body[key].collect{|y| q = y.inject({}){|q,(k,v)| q[k.to_sym] = v; q};eval "#{memo[:type]}.new(#{memo})"}
  			else
          errors = res.body["errors"]
  				raise "Error returned: #{res.status} #{errors}"
  			end
  		end

  		def get_object(method, key, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options)
  			if res.status == 200
  				res.body[key]
  			else
          errors = res.body["errors"]
  				raise "Error returned: #{res.status} #{errors}"
  			end
  		end

  end
end