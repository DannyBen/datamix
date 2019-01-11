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

  # Locking to 1.7.3 since 1.8.0 seem to be bugged
  # https://github.com/tj/terminal-table/issues/103
  s.add_runtime_dependency 'terminal-table', '1.7.3'
end
