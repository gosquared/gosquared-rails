## GoSquared Rails Gem

**This is an early beta, please open an issue if you find anything not working, or to leave feedback for improvement. You can also get in touch directly: russell@gosquared.com**


### Install of Analytics and Chat

With the GoSquared Rails gem you can quickly install GoSquared's tracking code on your app. GoSquared uses a javascript code snippet to track pageviews and optionally load the GoSquared Live Chat widget.

If you don't currently have a GoSquared tracking code on your site, you can quickly add the the code to all of your Rails’ views by running this:

```ruby
rails generate gosquared_rails:config 'your_project_token'
```

This will insert a `<script>` tag automatically before the closing `</body>` tag on each view rendered.

After generating your config file, if there are any controllers you would prefer not to have the tracking code automatically inserted in, you'll just need to add the following to that specific controller:

```ruby
skip_after_action :add_gosquared_script
```

### Configuration

```ruby
config.track_local = true
```
Whether to track data and load Live Chat on local pages/sites (using the file:// protocol, or on localhost). This helps prevent local development from polluting your stats.

```ruby
config.anonymize_ip = true
```
Setting this value to true will prevent the visitors' IP address from being tracked.

```ruby
config.cookie_domain = true
```
By default, cookie_domain will be the current domain (including subdomain). This means that IDs will not be shared across subdomains. Set this to .your-domain.com to enable accurate cross-subdomain tracking.

```ruby
config.use_cookies = true
```
Set to false to disable usage of cookies in the tracker (for example, if your site is subject to strict cookie legislation). This will mean that certain parts of GoSquared will be inaccurate.

```ruby
config.referrer = true
```
Use this option to override the value of the page's referring URL. This is useful if you know the source of the pageview via another tracking system.

```ruby
config.track_hash = false
```
Whether to track hashes in the page URL, for example /home#my-hash will, by default, be tracked as /home.
```ruby
config.track_params = true
```


### Installation of People

If you have a user system and would like to track down to an individual user level, you can do so by including the GoSquared Identify Method in your application controller

```ruby
append_after_filter  {|controller| controller.add_gosquared_identify_method your_current_user_object }
```

Then just define the following method in the respective controller and pass in a hash of any properties you'd like to track

```ruby
def gosquared_user_properties
GosquaredRails.configure.custom_properties = {id: current_user_object.id, email: current_user_object.email,
                                               phone: current_user_object.phone_number,
                                               monthly_mrr: current_user_object.mrr,
                                               role_of_user: current_user_object.role
                                               any_other_property: 'you'd like to track'}
end
```





#Tests

```ruby
rspec
```
