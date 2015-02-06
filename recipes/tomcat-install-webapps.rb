include_recipe "ark::default"

#src_filepath = "#{Chef::Config['file_cache_path']}"
to_filename = "#{node['bajt']['tomcat']['webapp'][0]['to_filename']}"
extract_path = "#{node['bajt']['tomcat']['home']}/#{node['bajt']['tomcat']['webapp'][0]['name']}"
#testfile = "/var/www/#{node['bajt']['tomcat']['webapp'][0]['name']}/Artists.html"

#puts "src_filepath =" + src_filepath
puts "to_filename =" + to_filename
puts "extract_path =" + extract_path
#puts "testfile =" + testfile

puts "tomcat src_url =" + "#{node['bajt']['tomcat']['webapp'][0]['src_url']}"
puts "webapp name =" + "#{node['bajt']['tomcat']['webapp'][0]['name']}"
puts "tomcat home =" + "#{node['bajt']['tomcat']['home']}"

directory "#{extract_path}" do
	owner 'tomcat'
	group 'tomcat'
	mode "0755"
	action :create
	recursive true
end

if node['bajt']['tomcat']['webapp'][0]['copy_with_ark_flag'] then
   puts "doing remote copy with ark"
	ark "#{node['bajt']['tomcat']['webapp'][0]['name']}" do
	  action :put
	  url node['bajt']['tomcat']['webapp'][0]['src_url']
	  path "#{node['bajt']['tomcat']['home']}"
	#  home_dir "/usr/local/jvm/default"
	#  checksum  '89ba5fde0c596db388c3bbd265b63007a9cc3df3a8e6d79a46780c1a39408cb5'
	#  append_env_path true
		owner 'tomcat'
		group 'tomcat'
		mode 0755
	end
else
   puts "do remote_file"	
	remote_file "#{extract_path}/#{to_filename}" do
	  source node['bajt']['tomcat']['webapp'][0]['src_url']
	#  checksum node['nginx']['foo123']['checksum']
	  owner 'tomcat'
	  group 'tomcat'
	  mode '0644'
	end
end

#ark "webapps" do
#  action :put
#  url 'http://10.0.2.2:81/sample.zip'
#  path "/var/lib/tomcat6"
#	owner 'tomcat'
#	group 'tomcat'
#	mode 0755
#end

