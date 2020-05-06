# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'sample_app_'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'sample_app::default'

# Specify a custom source for a single cookbook:
cookbook 'sample_app', path: '../cookbooks/sample_app'

#Policy defined attributes
default['sample_app'] ={
    "web": {
        "new_directory": "/var/www/html/myapp",
        "conf_path": "etc/apache2/sites-enabled/000-default.conf",
        "index_path": "/var/www/html/myapp/index.py",
        "document_root": "/var/www/html"
      }
}

