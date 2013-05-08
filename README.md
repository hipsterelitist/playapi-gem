The PlayAPI gem is the preferred method for server to server interactions with the platform.  While it is currently a work in progress, all the necessary base functionality is in place and unlikely to change since it is versioned against the API (currently APIv2). 

##Getting Started

Source for the gem can be found here: https://github.com/NIGHTSANDWEEKENDS/playapi-gem

Since we are currently in closed beta, the gem can only be installed via github. 

**You must have a PlayAPI account and credentials to use the gem, these can be obtained by contacting us or via the PlayAPI developer dashboard (pending release).**

###Configuration

An initializer can be used to configure the gem for your application.

	Playapi.configure do |c|
		c.client_id = ENV["PLAYAPI_CLIENT_ID"]
		c.client_secret = ENV["PLAYAPI_CLIENT_SECRET"]
		c.oauth_token = ENV["PLAYAPI_OAUTH_TOKEN"]
	end

###Fetching Your Campaign

	Playapi::Campaign.get
	=> #<Hashie::Mash display_name=nil id="516f1b9d6e293d0002000001" interaction_count=7 live=true name="foo" type="Campaign">

This will give you basic information about your currently scoped and authorized campaign.

###Basics of Interactions

	#<Hashie::Mash comments_count=0 content_id="INSTAGRAM_CONTENT_ID" entity_id="PLAYAPI_ENTITY_ID" id="PLAYAPI_ID" likes=8 link="http://instagram.com/p/Lv9su8QQlO/" name="foobar" points=15.0 text="hello world #hello #world" type="Instapic" visuals=[]>

The above is an example of an Instapic, one of PlayAPI's core interaction types. As you might have guessed, Instapics are PlayAPI's representation of Instagram data. Instapics can be pulled directly from Instagram using the Instagrabber feature or pushed from your application using the gem.  

	Playapi::Interaction.classed_interaction("Instapic", content_id: "bunny", name: "foo", feature_id: "517c47dd72b1d9000e000001", asset_url: "http://distilleryimage10.s3.amazonaws.com/342ac7a0b41011e1be6a12313820455d_7.jpg")

The above pushes a new Instapic to Playapi. The required fields for creating an Instapic: 
* **content_id** (required of all non-custom interactions)
* **name** (a service specific identifier, in this case "foo" on instagram)
* **feature_id** (the id of the feature which determines what to do with the object)
* **asset_url** (the url from which to source the image **-not required for other interaction types**)

The response from the above classed_interaction call should be: 

	=> #<Hashie::Mash comments_count=0 content_id="bunny" entity_id="51894c2a6e4bd2000e000004" feature_id="517c47dd72b1d9000e000001" id="51894c2a6e4bd2000e000003" likes=0 link=nil name="foo" points=0.0 text=nil type="Instapic" visuals=[...]>