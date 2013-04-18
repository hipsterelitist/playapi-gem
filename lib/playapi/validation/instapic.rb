module Playapi
  module Validation
    module Instapic

    	class << self

        def pkeys
          @pkeys ||= [
            :feature_id,
            :asset_url,
            :content_id,
            :name
          ]
        end

        def validate(opts)
          pkeys.each do |p|
            unless opts.include?(p)
              raise "#{p} must not be nil"
            end
          end
          opts.each do |interaction_field, value|
            #next if value.nil?

            unless value.is_a?(String) || value.is_a?(Integer) || value.is_a?(Float)
              raise("Invalid #{interaction_field} specified: #{value} must be a string or a number") unless value == points
            end
          end
        end
    	end
      
    end
  end
end