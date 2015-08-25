# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'invoices'
set :repo_url, 'git@github.com:rkleine/invoices.git'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'

set :deploy_to, '/home/deploy/invoices'

set :linked_files, %w{.rbenv-vars}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle certs}
