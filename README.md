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

#Tests

```ruby
rspec
```
