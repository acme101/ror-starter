#
# Cookbook:: ror-starter
# Recipe:: setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# ror project setup

# we need this because the guest path could change in the future
# instead of ~/workspace, it's likely that we'll use /mnt/workspace
cwd_path = node['acme']['ror-starter']['project_guest_path']


execute 'docker-compose pull --ignore-pull-failures --parallel' do
    cwd cwd_path
    command 'docker-compose pull --ignore-pull-failures --parallel'
end

# this is not needed after we have docker images pushed to the hub
# execute 'docker-compose build --pull' do
#     cwd cwd_path
#     command "docker-compose build --pull"
# end

# get the dev service up by default
execute 'docker-compose up -d app-dev' do
    cwd cwd_path
    command 'docker-compose up -d app-dev'
end
