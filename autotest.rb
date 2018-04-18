require 'listen' # gem install listen
require_relative 'lib/test_runner'

listener = Listen.to(File.dirname(__FILE__)) do |modified, added, removed|
  modified.each { |f| run_test_from(f) }
end
listener.start # not blocking
sleep
