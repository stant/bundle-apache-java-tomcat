include_recipe 'ark::default'
##include_recipe 'hostsfile'

hostsEntry = ""

node['bajt']['apache_webapps'].keys.each do |webappkey|
      #puts ">#{group1}<  -  " + #{node['bajt']['apache_webapps'][group1] + "<"
      puts "working on webappkey =" + webappkey + "="
      apache_webapps = node['bajt']['apache_webapps'][webappkey]

      hostsEntry += "   " + "#{apache_webapps['server_name_aliases']}"
		if ( ! apache_webapps['server_name_aliases'].nil? && defined?(apache_webapps['server_name_aliases']) ) then
			hostsEntry += "   " + "#{apache_webapps['server_name_aliases']}"
		end
		puts "hostsEntry =" + hostsEntry
      
		directory "#{node['bajt']['apache']['docroot']}/#{apache_webapps['name']}" do
			owner 'apache'
			group 'apache'
			mode "0755"
			action :create
			recursive true
		end
		
		if node['bajt']['apache']['create_demo_index_htmls'] then
			puts "*** WARNING: Only creating demo web sites at index.html !"
			template "#{node['bajt']['apache']['docroot']}/#{apache_webapps['name']}/index.html" do
				action :create
				source "index.html.erb"
				mode "0655"
				owner 'apache'
				group 'apache'
				variables({
					  :website_name => "#{apache_webapps['name']}"
				  })				
			end
		else		
			web_app "#{apache_webapps['name']}" do
				#name node['bajt']['apache']['webapp'][0]['name']
				owner 'apache'
				group 'apache'
				template apache_webapps['template']
				listen_ports apache_webapps['listen_ports']
				server_name apache_webapps['server_name']
				server_aliases apache_webapps['server_name_aliases']   # node['fqdn'], 
				docroot "#{node['bajt']['apache']['docroot']}/#{apache_webapps['name']}"
				set_reverse_proxypass_at_url   apache_webapps['set_reverse_proxypass_at_url']
				set_reverse_proxypassreverse_at_url   apache_webapps['set_reverse_proxypassreverse_at_url']
			end
		end	

		if ( ! apache_webapps['src_url'].nil? && defined?(apache_webapps['src_url']) ) then
			ark "#{apache_webapps['name']}" do
			  action :put
			  url apache_webapps['src_url']
			  path "#{node['bajt']['apache']['docroot']}"
			#  home_dir "/usr/local/jvm/default"
			#  checksum  '89ba5fde0c596db388c3bbd265b63007a9cc3df3a8e6d79a46780c1a39408cb5'
			#  append_env_path true
				owner 'apache'
				group 'apache'
				mode 0755
			end
		end

end

###  Add all hosts to one host file entry  ###
hostsfile_entry "#{node['ipaddress']}" do
  hostname hostsEntry
  action :create
end

#src_filename = "CraftersClearance.tar"
#src_filepath = "#{Chef::Config['file_cache_path']}"
#extract_path = "/var/www/#{node['bajt']['apache']['webapp'][0]['name']}"
#testfile = "/var/www/#{node['bajt']['apache']['webapp'][0]['name']}/Artists.html"

#puts "src_filename =" + src_filename
#puts "src_filepath =" + src_filepath
#puts "extract_path =" + extract_path
#puts "testfile =" + testfile

#remote_file "#{src_filepath}/#{src_filename}" do
#  source node['bajt']['apache']['webapp'][0]['src_url']
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

