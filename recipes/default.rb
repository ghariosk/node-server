#
# Cookbook:: node-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


apt_update 'update' do
	action :update
end

package 'nginx'

service 'nginx' do 
 supports status: true, restart: true, reload: true
 action [:enable, :start]	
end

remote_file '/tmp/node_installer' do 
	source 'https://deb.nodesource.com/setup_6.x'
	action :create
end
	
execute ' install node sources' do
	command 'sh /tmp/node_installer'
end

package 'nodejs' do
	action :upgrade
end


execute 'install pm2' do
	command "npm install pm2 -g"
end

template '/etc/nginx/sites-available/proxy.conf' do
	source 'proxy.conf.erb'
	owner 'root'
	group 'root'
	mode '0755'
end


link '/etc/nginx/sites-enabled/default' do
	action :delete
end

link '/etc/nginx/sites-available/proxy.conf' do
	to '/etc/nginx/sites-enabled'
	action :create
end

service 'nginx' do
	action :restart
end


