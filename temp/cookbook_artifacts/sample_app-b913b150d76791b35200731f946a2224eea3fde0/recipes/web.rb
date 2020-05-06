#
# Cookbook:: lamp
# Recipe:: web
#
# Copyright:: 2020, The Authors, All Rights Reserved.

bash 'install_requirement' do
    code <<-EOH
    sudo apt update
    EOH
end
package 'apache2'

template node['sample_app']['web']['conf_path'] do
    source 'default.conf.erb'
    owner 'root'
    group 'root'
    mode '0755'
end

directory node['sample_app']['web']['new_directory'] do
    recursive true
end

# python code
template node['sample_app']['web']['index_path'] do
    source 'index.py.erb'
    
    owner 'root'
    group 'root'
    mode '0755'
end

# custom resource
pyconfig 'setup'

service 'apache2' do
    action [:start, :enable]
end
