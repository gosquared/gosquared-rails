lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = "gosquared-rails"
  spec.version     = "0.0.1"
  spec.authors     = ["Russell Vaughan"]
  spec.email       = ["russellvaughan@gmail.com"]
  spec.homepage    = "https://"
  spec.summary     = %q{Rails helper for injecting and configuring the GoSquared JavaScript tracking code and Identify method}
  spec.description = %q{GoSquared is your all-in-one software platform for marketing, sales, and support.
  This Ruby gem is for quickly installing GoSquared Chat, Analytics and People CRM in your Rails App .}
  spec.files         = Dir['lib/**/*', 'Gemfile', 'gs-rails.gemspec', '.rspec', 'README.md', 'LICENSE']
  spec.executables   = Dir['bin/*']
  spec.test_files    = Dir['spec/**/*']
  spec.require_paths = ['lib']
  spec.licenses       = ['MIT']

end
