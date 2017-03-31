lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'datamix/version'

Gem::Specification.new do |s|
  s.name        = 'datamix'
  s.version     = DataMix::VERSION
  s.date        = Date.today.to_s
  s.summary     = "DSL for manipulating tabular data"
  s.description = "DSL for manipulating tabular data"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.homepage    = 'https://github.com/DannyBen/datamix'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.1.0"

  s.add_runtime_dependency 'terminal-table', '~> 1.7'

  s.add_development_dependency 'runfile', '~> 0.9'
  s.add_development_dependency 'runfile-tasks', '~> 0.4'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'rdoc', '~> 5.0'
  s.add_development_dependency 'simplecov', '~> 0.13'
  s.add_development_dependency 'yard', '~> 0.8'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-doc', '~> 0.10'
  s.add_development_dependency 'filewatcher', '~> 0.5'
end
