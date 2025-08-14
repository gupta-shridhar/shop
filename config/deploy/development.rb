server "localhost", user: "deploy", roles: %w{app db web}
set :ssh_options, {
  forward_agent: true
}
set :branch, "main"  # or any branch you want to deploy
