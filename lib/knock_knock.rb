$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'active_support'
require File.dirname(__FILE__) + '/bubble/knock_knock/exceptions'
require File.dirname(__FILE__) + '/bubble/knock_knock/hash'
require File.dirname(__FILE__) + '/bubble/knock_knock/connection'
require File.dirname(__FILE__) + '/bubble/knock_knock/request'

module Bubble
  module KnockKnock
    VERSION = '0.0.3'
    APP_NAME = 'KnockKnock Ruby Gem'
  end
end