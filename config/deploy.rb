# config valid only for current version of Capistrano
lock "~> 3.12.1"

# App name
set :application, "task2"

# Where to fetch source from
set :repo_url, "git@github.com:NadaJawaker/Task2.git"

# Where app files will be
set :deploy_to, "/home/deploy/#{fetch :application}"
# Rbenv specific settings
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# when using db, you should add config/database.yml here
set :linked_files, fetch(:linked_files, []).concat(%w{.rbenv-vars})
set :linked_dirs, fetch(:linked_dirs, []).concat(%w{log tmp/pids tmp/cache tmp/sockets vendor/bundle})

