lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = "gosquared-rails"
  spec.version     = "1.2.0"
  spec.authors     = ["Russell Vaughan"]
  spec.email       = ["russell@gosquared.com"]
  spec.homepage    = "https://github.com/gosquared/gosquared-rails"
  spec.summary     = %q{Gem for injecting and configuring the new GoSquared Assistant via our JavaScript tracking code and Identify method}
  spec.description = %q{GoSquared is the all-in-one growth software for SaaS businesses.
  This gem is for quickly installing the GoSquared intelligent in-app messaging and live chat Assistant, GoSquared Real-time Analytics and the People Customer Data Hub in your Rails App .}
  spec.files         = Dir['lib/**/*', 'Gemfile', 'gs-rails.gemspec', '.rspec', 'README.md', 'LICENSE']
  spec.executables   = Dir['bin/*']
  spec.test_files    = Dir['spec/**/*']
  spec.require_paths = ['lib']
  spec.licenses       = ['MIT']
end
