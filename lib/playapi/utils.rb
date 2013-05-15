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
  				res.body[key].collect{|y| sym_hash = convert_string_hash_to_sym(y); eval "#{sym_hash[:type]}.new(#{sym_hash})"}
  			else
          errors = res.body["errors"]
  				raise "Error returned: #{res.status} #{errors}"
  			end
  		end

  		def get_object(method, key, path, options={})
  			res = Playapi.client.connection.send(method.to_sym, path, options)
  			if res.status == 200
  				sym_hash = convert_string_hash_to_sym(res.body[key])
          eval "#{sym_hash[:type]}.new(#{sym_hash})"
  			else
          errors = res.body["errors"]
  				raise "Error returned: #{res.status} #{errors}"
  			end
  		end

      def get_raw
        res = Playapi.client.connection.send(method.to_sym, path, options)
        if res.status == 200
          res.body[key]
        else
          errors = res.body["errors"]
          raise "Error returned: #{res.status} #{errors}"
        end
      end

      def convert_string_hash_to_sym(string_hash)
        q = string_hash.inject({}){|q,(k,v)| q[k.to_sym] = v; q}
      end

  end
end