module Playapi
	class TwitterScraper < Playapi::Feature
		attr_reader :hashtags, :user_ids, :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret

	end
end