# custom resource name
resource_name :pyconfig

action :create do
    # install initial requirements
    bash 'install_requirements' do
        code <<-EOH
        sudo apt install python3 -y
        sudo apt-get install python3-pip -y
        sudo -H pip3 install --upgrade pip
        sudo pip3 install pymysql
        sudo a2dismod mpm_event
        sudo a2enmod mpm_prefork cgi
        sudo chmod 755 #{node['sample_app']['web']['index_path']}
        EOH
    end

end
