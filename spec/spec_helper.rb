require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

include DataMix

def fixture(filename)
  File.read "spec/fixtures/#{filename}"
end