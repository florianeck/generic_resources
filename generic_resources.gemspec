Gem::Specification.new do |s|
  s.name        = 'generic_resources'
  s.version     = '0.1.2'
  s.license     = "MIT"
  s.summary     = "Easy CRUD Interface for Rails"
  s.description = "Use just one Controller to CRUD all your resources instead of having lots of of scaffold controllers"
  s.authors     = ["Florian Eck"]
  s.email       = 'florian.eck@el-digital.de'

  s.files       = Dir.glob("lib/**/*")
  s.files       += Dir.glob("app/**/*")
  s.files       += Dir.glob("config/**/*")
  s.files       += Dir.glob("db/**/*")
  s.test_files  = Dir["spec/**/*"]

  s.add_runtime_dependency "rails", ">= 4.0.4", "< 5.0"
  s.add_runtime_dependency "gem_config", "~> 0"
  s.add_runtime_dependency 'kaminari', "~> 0"

  s.homepage    = "https://github.com/florianeck/generic_resources"
end