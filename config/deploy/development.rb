server "localhost", user: "deploy", roles: %w{app db web}
set :ssh_options, {
  forward_agent: true
}
set :default_shell, "/bin/bash -l"
set :branch, "main"  # or any branch you want to deploy
