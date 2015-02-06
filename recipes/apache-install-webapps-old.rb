include_recipe 'ark::default'

directory "/var/www/#{node['bajc']['apache']['webapp'][0]['name']}" do
	owner 'apache'
	group 'apache'
	mode "0755"
	action :create
	recursive true
end

if node['bajc']['apache']['create_demo_index_htmls'] then
	template "/var/www/#{node['bajc']['apache']['webapp'][0]['name']}/index.html" do
		action :create
		source "index.html.erb"
		mode "0655"
		owner 'apache'
		group 'apache'
	end
end	

web_app "#{node['bajc']['apache']['webapp'][0]['name']}" do
	#name node['bajc']['apache']['webapp'][0]['name']
	owner 'apache'
	group 'apache'
	template node['bajc']['apache']['webapp'][0]['template']
	server_name node['bajc']['apache']['webapp'][0]['server_name']
	server_aliases node['bajc']['apache']['webapp'][0]['server_name_aliases']   # node['fqdn'], 
	docroot node['bajc']['apache']['webapp'][0]['docroot']
end

ark "#{node['bajc']['apache']['webapp'][0]['name']}" do
  action :put
  #url 'http://10.0.2.2:81/CraftersClearance.tar'
  url node['bajc']['apache']['webapp'][0]['src_url']
  path "#{node['bajc']['apache']['docroot']}"
#  home_dir "/usr/local/jvm/default"
#  checksum  '89ba5fde0c596db388c3bbd265b63007a9cc3df3a8e6d79a46780c1a39408cb5'
#  append_env_path true
	owner 'apache'
	group 'apache'
	mode 0755
end

#src_filename = "CraftersClearance.tar"
#src_filepath = "#{Chef::Config['file_cache_path']}"
#extract_path = "/var/www/#{node['bajc']['apache']['webapp'][0]['name']}"
#testfile = "/var/www/#{node['bajc']['apache']['webapp'][0]['name']}/Artists.html"

#puts "src_filename =" + src_filename
#puts "src_filepath =" + src_filepath
#puts "extract_path =" + extract_path
#puts "testfile =" + testfile

#remote_file "#{src_filepath}/#{src_filename}" do
#  source node['bajc']['apache']['webapp'][0]['src_url']
##  checksum node['nginx']['foo123']['checksum']
#  owner 'apache'
#  group 'apache'
#  mode '0644'
#end

#bash 'extract_webapp' do
#  cwd ::File.dirname(src_filepath)
#  code <<-EOH
#    mkdir -p #{extract_path}
#    tar xvf #{src_filepath}/#{src_filename} -C #{extract_path}
#    EOH
#  not_if { ::File.exists?(testfile) }
#end

#     mv #{extract_path}/*/* #{extract_path}/

