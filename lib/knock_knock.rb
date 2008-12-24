$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'active_support'

# A project developed by Bubble[http://bubble.com.br]
module Bubble

  # For more information take a look at the README
  module KnockKnock
    VERSION = '0.1.6'
    APP_NAME = 'KnockKnock Ruby Gem'
  end
end

require File.dirname(__FILE__) + '/bubble/knock_knock/exceptions'
require File.dirname(__FILE__) + '/bubble/knock_knock/services'
require File.dirname(__FILE__) + '/bubble/knock_knock/hash'
require File.dirname(__FILE__) + '/bubble/knock_knock/connection'
require File.dirname(__FILE__) + '/bubble/knock_knock/request'