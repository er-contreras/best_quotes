require './config/application'

# map "/" do
#   run QuotesController.action(:index)
# end

app = BestQuotes::Application.new

use Rack::ContentType

app.route do
  match "", "quotes#index"
  match "sub-app", proc { [200, {}, ["Hello, sub-app!"]] }

  # default routes
  match ":controller/:id/:action"
  match ":controller/:id", :default => { "action" => "show" }
  match ":controller", :default => { "action" => "index" }
end

run app

# run proc { [200, {'Content-Type' => 'text/html'}, ['Hello World!'] ]}

# obj = Object.new
# def obj.call(*args)
#   [200, {'Content-Type' => 'text/html'}, ['Hello World!']]
# end
# run obj

# INNER_LAYER = proc { "world!" }
# OUTER_LAYER = proc {
#   inner_content = INNER_LAYER.call
#   [200, {'Content-type' => 'text/html'},
#    ["Hello," + inner_content]]
# }
# run OUTER_LAYER

# use Rack::Auth::Basic, "app" do |_, pass|
#   'secret' == pass
# end
# run proc {
#   [200, {'Content-Type' => 'text/html'}, ['Hello World!']]
# }

# class Canadianize
#   def initialize(app, arg = "")
#     @app = app
#     @arg = arg
#   end
#
#   def call(env)
#     status, headers, content = @app.call(env)
#     content[0] += @arg + ", eh?"
#     [status, headers, content]
#   end
# end
#
# use Canadianize, ", simple"
# run proc {
#   [200, {'Content-Type' => 'text/html'}, ['Hello World!']]
# }

# require 'rack/lobster'
# use Rack::ContentType
#
# map "/lobster" do
#   use Rack::ShowExceptions
#   run Rack::Lobster.new
# end
#
# map "/lobster/but_not" do
#   run proc {
#     [200, {'Content-Type' => 'text/html'}, ['Hello World!']]
#   }
# end
#
# run proc {
#   [200, {'Content-Type' => 'text/html'}, ['Hello World!']]
# }

# require 'rack/lobster'
#
# use Rack::ContentType
#
# class BenchMarker
#   def initialize(app, runs = 100)
#     @app, @runs = app, runs
#   end
#
#   def call(env)
#     t = Time.now
#
#     result = nil
#     @runs.times do
#       result = @app.call(env)
#     end
#
#     t2 = Time.now - t
#     STDERR.puts(<<-OUTPUT)
#     Benchmark:
#       #{@runs} times
#       #{t2.to_f} seconds total
#       #{t2.to_f * 1000 / @runs} miliseconds/run
#     OUTPUT
#
#     result
#   end
# end
#
# use BenchMarker, 10_000
#
# run Rack::Lobster.new
