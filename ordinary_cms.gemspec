$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ordinary_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ordinary_cms"
  s.version     = OrdinaryCms::VERSION
  s.authors     = ["max-konin"]
  s.email       = ["maxim21214@gmail.com"]
  s.homepage    = "https://github.com/max-konin/ordinary_cms"
  s.summary     = "OrdinaryCms"
  s.description = "Description of OrdinaryCms."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.1"
end
