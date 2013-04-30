Gem::Specification.new do |s|
  s.name        = 'playapi'
  s.version     = '0.1.0'
  s.date        = '2013-04-22'
  s.summary     = "PlayAPI helps you make games."
  s.description = "Interact with PlayAPI"
  s.authors     = ["Chris France"]
  s.email       = 'france@playapi.com'
  s.files       = ["lib/playapi.rb", "lib/playapi/client.rb", 
                  "lib/playapi/entity.rb",
                  "lib/playapi/interaction.rb",
                  "lib/playapi/visual.rb",
                  "lib/playapi/feature.rb",
                  "lib/playapi/campaign.rb",
                  "lib/playapi/configurable.rb",
                  "lib/playapi/utils.rb",
                  "lib/playapi/validation/instapic.rb",
                  "lib/playapi/validation/tweet.rb",
                  "lib/playapi/validation/instagrabber.rb",
                  "lib/playapi/validation/twitterscraper.rb",
                  "lib/playapi/validation/picking.rb",
                  "lib/playapi/validation/feature.rb",
                  "lib/playapi/validation/custom.rb"
                ]
  s.homepage    =
    'http://rubygems.org/gems/playapi'
end