require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require 'capistrano/bundler'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
