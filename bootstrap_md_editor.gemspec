$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_md_editor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_md_editor"
  s.version     = BootstrapMdEditor::VERSION
  s.authors     = ["Dieter Lunn"]
  s.email       = ["coder2000@gmail.com"]
  s.homepage    = "http://github.com/coder2000/bootstrap_md_editor"
  s.summary     = "Markdown editor with Bootstrap 4"
  s.description = "Simple Markdown editor styled with Bootstrap"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1", ">= 5.1.4"

  s.add_development_dependency "bootstrap-sass", "~> 4.0.0.beta"
end
