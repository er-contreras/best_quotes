require 'peacer'
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module BestQuotes
  class Application < Peacer::Application
  end
end