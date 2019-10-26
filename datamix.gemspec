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

  s.add_runtime_dependency 'tty-table', '0.11'
end
