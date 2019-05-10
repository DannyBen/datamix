require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

include DataMix

RSpec.configure do |c|
  c.fixtures_path = 'spec/approvals'
end

def fixture(filename)
  File.read "spec/fixtures/#{filename}"
end