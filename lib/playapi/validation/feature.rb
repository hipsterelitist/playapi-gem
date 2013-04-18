module Playapi
  module Validation
    module Feature

    	class << self

        def pkeys
          @pkeys ||= [
            :name,
            :description,
            :type
          ]
        end

        def validate(opts)
          pkeys.each do |p|
            unless opts.include?(p)
              raise "#{p} must not be nil"
            end
          end
          opts.each do |field, value|
          	raise "Type should not be specified in options!" if field.to_s == "type"
            #next if value.nil?

            unless value.is_a?(String) || value.is_a?(Integer) || value.is_a?(Float)
              raise("Invalid #{value} specified: #{field} must be a string or a number") unless value == points
            end
          end
        end
    	end
      
    end
  end
end