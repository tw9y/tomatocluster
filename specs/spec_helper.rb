ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'
require_relative '../config/boot'
