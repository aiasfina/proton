$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "proton/backend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "proton-backend"
  s.version     = Proton::Backend::VERSION
  s.authors     = ["aiasfina"]
  s.email       = ["aiasfina@gmail.com"]
  s.summary     = "Summary of Proton::Backend."
  s.description = "escription of Proton::Backend."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'gentelella-rails', '~> 0.1.4'
  s.add_dependency 'turbolinks', '~> 5.0.1'
  s.add_dependency 'kaminari', '~> 1.0.1'
  s.add_dependency 'codemirror-rails', '~> 5.16.0'
end
