
puts "*** RUNNING bundle-apache-java-tomcat default.rb"

#########  Apache  #########
## setting demo to true makes it create a simple index.html for each website 
## and not download your webapp files or set them up.
default['bajt']['apache']['create_demo_index_htmls'] = false

default['bajt']['apache']['docroot'] = "/var/www"

# default['bajt']['apache']['webapp'][0]['server_name'] = 'bundle-apache-java-tomcat.home.com'
# #default['bajt']['apache']['webapp'][0]['server_name_aliases'] = ''
# default['bajt']['apache']['webapp'][0]['name'] = 'webapp_0'
# default['bajt']['apache']['webapp'][0]['template'] = 'webapp_0.conf.erb'
# default['bajt']['apache']['webapp'][0]['docroot'] = "#{node['bajt']['apache']['docroot']}/#{node['bajt']['apache']['webapp'][0]['name']}"
# default['bajt']['apache']['webapp'][0]['src_url'] = 'http://10.0.2.2:81/website.tar'
# #default['bajt']['apache']['webapp'][0]['directory_index'] = 'xxx'
# #default['bajt']['apache']['webapp'][0]['directory_options'] = 'xxx'

#default['apache']['listen_ports'] += %w( 82 )

# proxy_ajp
default['apache']['default_modules'] += %w( proxy proxy_http )
default['apache']['proxy']['deny_from'] = 'none'
default['apache']['proxy']['allow_from'] = 'all'

#########  Tomcat  #########
default['bajt']['tomcat']['home'] = "/var/lib/tomcat6"
default['bajt']['tomcat']['webapp'][0]['name'] = "webapps"
default['bajt']['tomcat']['webapp'][0]['copy_with_ark_flag'] = false
default['bajt']['tomcat']['webapp'][0]['src_url'] = 'http://10.0.2.2:81/sample.war'
default['bajt']['tomcat']['webapp'][0]['to_filename'] = "sample.war"

#  this is for proxy_http
default["tomcat"]["proxy_port"] = 8080

#########  Java  #########
#default['java']['install_flavor'] = "openjdk"
default['java']['install_flavor'] = "oracle"
default['java']['jdk_version'] = '7'
default['java']['oracle']['accept_oracle_download_terms'] = true

