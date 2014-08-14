$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ordinary_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ordinary_cms"
  s.version     = OrdinaryCms::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of OrdinaryCms."
  s.description = "TODO: Description of OrdinaryCms."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.1"
end
