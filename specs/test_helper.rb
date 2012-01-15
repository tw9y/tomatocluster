ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/spec'
require 'rack/test'
require_relative '../app'
