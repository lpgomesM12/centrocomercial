set :stage, :production
server '107.170.54.89', user: 'deploy', roles: %w{web app db}