# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "green_monkey"
  s.version     = '0.1.4'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pavel Evstigneev"]
  s.email       = ["pavel.evst@gmail.com"]
  s.homepage    = "https://github.com/paxa/green_monkey"
  s.summary     = "Rails and Haml microdata layout helpers"
  s.description = "It hacks Rails and Haml"

  s.required_rubygems_version = ">= 1.2.0"

  #s.add_runtime_dependency 'rails', '>= 3.0.0'
  s.add_runtime_dependency 'haml', '>= 3.1.0'
  s.add_runtime_dependency 'mida_vocabulary', '>= 0.1'
  s.add_runtime_dependency 'chronic_duration'
  
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.7.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "mida"
  s.add_development_dependency 'sqlite3'

  s.files = Dir['Gemfile', 'README.md', 'Rakefile', 'lib/**/*']
  s.executables  = []
  s.require_paths = ["lib"]
end

