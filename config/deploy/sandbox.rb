set :rails_env, 'production'
server 'ohsu2018.curationexperts.com', user: 'deploy', roles: [:web, :app, :db]