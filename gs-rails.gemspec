lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = "gs-rails"
  spec.version     = "0.0.4"

  spec.authors     = ["Russell Vaughan"]
  spec.email       = ["russellvaughan@gmail.com"]
  spec.homepage    = "https://"
  spec.summary     = %q{GoSquared Rails Gem}
  spec.description = %q{A Ruby gem for injecting the GoSquared tracking code into your Rails App .}

  spec.files         = Dir['lib/**/*', 'Gemfile', 'gs-rails.gemspec', '.rspec', 'README.md', 'LICENSE']
  spec.executables   = Dir['bin/*']
  spec.test_files    = Dir['spec/**/*']
  spec.require_paths = ['lib']
  spec.licenses       = ['MIT']

end
