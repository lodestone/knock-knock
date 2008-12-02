# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('knock-knock', '0.1.0') do |p|
  p.description    = "Google Data Api ClientLogin Auth in Ruby"
  p.url            = "http://github.com/alexgregianin/knock-knock"
  p.author         = "Alex Gregianin"
  p.email          = "alexandre@bubble.com.br"
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

