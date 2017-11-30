## GoSquared Rails Gem

[![Build Status](https://travis-ci.org/gosquared/gosquared-rails.svg?branch=master)](https://travis-ci.org/gosquared/gosquared-rails)

The GoSquared Rails Gem will allow you to quickly and easily install GoSquared Live Chat, Anayltics and People in your Rails app.

Note, this gem is currently dependent on jQuery which Rails has dropped as a dependency as of Rails v5.1.0. If you are not already using jQuery within your app, you'll have to include it via a gem such as [Jquery-rails] (https://github.com/rails/jquery-rails)

If you are looking to interact with our Tracking or Reporting API's, you can do so by using our [Ruby Client]
(https://github.com/gosquared/ruby-client)

This gem will inject the GoSquared JavaScript snippet as well as GoSquared Identify method in your front end. If you currently have GoSquared JavaScript snippets in place, this can create a conflict.

**Please feel free to open an issue if you find anything not working, or to leave feedback for improvement. You can also get in touch directly: russell@gosquared.com**

### Install Analytics and Live Chat

With the GoSquared Rails gem you can quickly install GoSquared's tracking code on your app. GoSquared uses a javascript code snippet to track pageviews and optionally load the GoSquared Live Chat widget.

If you don't have a GoSquared account and you can sign up for one [here](https://www.gosquared.com/join/) and get your project token. Then you can quickly add the code to all of your Rails’ views by running this:

```ruby
rails generate gosquared_rails:config 'your_project_token'
```

This will insert a `<script>` tag automatically before the closing `</head>` tag on each view rendered.

After generating your config file, if there are any controllers you would prefer not to have the tracking code automatically inserted in, you'll just need to add the following to that specific controller:

```ruby
skip_after_action :add_gosquared_script
```

### Configuration

To configure GoSquared Analytics tracking, you can do so in ```conifg/initializers/gosquared_rails.rb```

```ruby
config.track_local = true
```
Whether to track data and load Live Chat on local pages/sites (using the file:// protocol, or on localhost). This helps prevent local development from polluting your stats.

```ruby
config.anonymize_ip = true
```
Setting this value to true will prevent the visitors' IP address from being tracked.

```ruby
config.cookie_domain = '.your-domain.com'
```
By default, cookie_domain will be the current domain (including subdomain). This means that IDs will not be shared across subdomains. Set this to .your-domain.com to enable accurate cross-subdomain tracking.

```ruby
config.use_cookies = false
```
Set to false to disable usage of cookies in the tracker (for example, if your site is subject to strict cookie legislation). This will mean that certain parts of GoSquared will be inaccurate.

```ruby
config.referrer = 'some_other_domain'
```
Use this option to override the value of the page's referring URL. This is useful if you know the source of the pageview via another tracking system.

```ruby
config.track_hash = true
```
Whether to track hashes in the page URL, for example /home#my-hash will, by default, be tracked as /home.

```ruby
config.track_params = false
```
Whether to track URL querystring parameters, for example /home?my=query&string=true will be tracked as /home if this is set to false.

For more details on configuration, you can view the docs here https://www.gosquared.com/docs/api/javascript-tracking-code/configuration#

### Installation of People (identify users)

If you have a user system and would like to track down to an individual user level, you can do so by including the GoSquared Identify Method in your ApplicationController (or any indvidual controller you would like to track.)

```ruby
append_after_action  {|controller| controller.add_gosquared_identify_method, your_current_user_object }
```

Then just define the following method in the respective controller and pass in a hash of any properties you'd like to track

```ruby
def gosquared_user_properties
GosquaredRails.configure.custom_properties = {id: current_user_object.id, email: current_user_object.email,
                                               phone: current_user_object.phone_number,
                                               monthly_mrr: current_user_object.mrr,
                                               role_of_user: current_user_object.role
                                               any_other_property: "you'd like to track"}
end
```

This will insert a `<script>` tag automatically before the closing `</body>` tag on each view rendered.


#Tests

```ruby
rspec
```
