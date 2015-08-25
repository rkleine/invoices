require 'rack/cors'
require "./app"

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get]
  end
end

run Cuba
