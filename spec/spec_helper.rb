ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'minitest/autorun'
require 'minitest/spec'
require_relative '../config/boot'
