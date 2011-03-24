# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "site_config/version"

Gem::Specification.new do |s|
  s.name        = "site_config"
  s.version     = SiteConfig::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Simple site-wide config engine for Rails using mongoid"
  s.files       = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]

  s.authors     = ["Grzesiek Kołodziejczyk"]
  s.email       = ["gkolodziejczyk@gmail.com"]
  s.homepage    = "https://github.com/grk/site_config/"

  s.add_dependency "rails", "~> 3.0.5"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "mongoid", ">= 2.0.0.rc.7"
  s.add_development_dependency "bson_ext", ">= 1.2.4"
  s.add_development_dependency "rspec", ">= 2.5.0"
  s.add_development_dependency "capybara"
end