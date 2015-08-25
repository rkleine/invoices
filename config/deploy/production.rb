set :stage,     :production
set :branch,    :master
set :rack_env,  :production

server 'invoices.gweb.io', user: 'deploy', roles: %w{web app db}
