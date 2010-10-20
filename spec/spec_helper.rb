$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'constructor'
require 'rspec'

# Sorry...

RSpec.configure do |config|
end