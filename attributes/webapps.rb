
puts "*** RUNNING bundle-apache-java-tomcat webapps.rb"

default['bajt']['apache_webapps'] = "set to string to clear hash"

default['bajt']['apache_webapps'] =
						{
						 "webapp_1" => { "name" => "webapp_1",
									  "server_name" => "bundle-apache-java-tomcat.webapp1.com",
									  "server_name_aliases" => ["webapp1.com"],
									  "template" => 'webapp.conf.erb',
									  "listen_ports" => '80',
									  "src_url" => 'http://10.0.2.2:81/website1.zip',
						 			},
						  "webapp_2" => { "name" => "webapp_2",
									  "server_name" => "bundle-apache-java-tomcat.webapp2.com",
									  "server_name_aliases" => nil,
									  "template" => 'webapp.conf.erb',
									  "src_url" => 'http://10.0.2.2:81/website2.zip'
									},
						 "webapp_3" => { "name" => "webapp_3",
									  "server_name" => "bundle-apache-java-tomcat.webapp3.com",
									  "server_name_aliases" => ["webapp3.com"],
									  "template" => 'webapp.conf.erb',
									  "set_reverse_proxypass_at_url" => 'http://bundle-apache-java-tomcat.webapp3.com:8080/sample',
									  "set_reverse_proxypassreverse_at_url" => 'http://bundle-apache-java-tomcat.webapp3.com/'
						 			}
					   }

  		
puts " "
puts "*** bundle-apache-java-tomcat webapps ***"
node['bajt']['apache_webapps'].keys.each do |group1|
  node['bajt']['apache_webapps'][group1].keys.each do |group2|
      apache_webapps = node['bajt']['apache_webapps'][group1]
		if ( (! node['bajt']['apache_webapps'][group1][group2].nil?) && (node['bajt']['apache_webapps'][group1][group2].kind_of?(String)) )
			puts ">#{group1}< >#{group2}<  -  " + node['bajt']['apache_webapps'][group1][group2] + "<"
			puts "=" + apache_webapps[group2] + "="
		end
  end
end

