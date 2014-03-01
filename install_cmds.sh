export PATH=$PATH:/opt/chef/embedded/bin/
cd /tmp/ncftp
berks vendor /etc/chef/cookbooks/
cp -r /tmp/ncftp /etc/chef/cookbooks/
chef-solo
