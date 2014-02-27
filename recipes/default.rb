execute "Extracting and Building ncftp #{node['ncftp']['version']} from Source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    export http_proxy=#{node['proxy']}
    wget ftp://ftp.ncftp.com/ncftp/ncftp-#{node['ncftp']['version']}-src.tar.gz
    tar xzf ncftp-#{node['ncftp']['version']}-src.tar.gz
    cd ncftp-#{node['ncftp']['version']}
    ./configure --prefix=#{node['ncftp']['prefix']}
    make
    make install
  COMMAND
  creates "#{node['ncftp']['prefix']}/bin/ncftp"
  not_if "#{node['ncftp']['prefix']}/bin/ncftp 2>/dev/null | grep #{node['ncftp']['version']}"
end
