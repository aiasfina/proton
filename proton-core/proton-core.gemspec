$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "proton/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "proton-core"
  s.version     = Proton::Core::VERSION
  s.authors     = ["aiasfina"]
  s.email       = ["aiasfina@gmail.com"]
  s.summary     = "Summary of Proton::Core."
  s.description = "Description of Proton::Core."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
