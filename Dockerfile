FROM muratayusuke/chef-solo-berkshelf3

ENV LANG C.UTF-8

RUN mkdir -p /tmp/ncftp
ADD ./solo.rb /etc/chef/solo.rb
ADD ./node.json /etc/chef/node.json
ADD ./Berksfile /tmp/ncftp/Berksfile
ADD ./attributes /tmp/ncftp/attributes
ADD ./recipes /tmp/ncftp/recipes
ADD ./install_cmds.sh /tmp/ncftp/install_cmds.sh
ADD ./metadata.rb /tmp/ncftp/metadata.rb
ADD ./README.md /tmp/ncftp/README.md
RUN /tmp/ncftp/install_cmds.sh