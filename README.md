# bundle-apache-java-tomcat-cookbook

The purpose I was aiming for was to create an easy way to install a common bundle of software. In this case I also aim to make it easy to install multiple web sites via a simple list of parameters with web site files to install.

## Supported Platforms

Chef supported linuxes.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['bajt']['apache']['create_demo_index_htmls']</tt></td>
    <td>Boolean</td>
    <td>If true, this will create simple ['bajt']['apache']['docroot']/index.html pages for each web site created.</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['bajt']['apache']['docroot']</tt></td>
    <td>String</td>
    <td>main root path to apache doc files.</td>
    <td><tt>/var/www</tt></td>
  </tr>
  <tr>
    <td><tt>attributes for project svanzoest/apache2-cookbook</tt></td>
    <td>&nbsp;</td>
    <td>see: <a href="https://github.com/svanzoest/apache2-cookbook">apache</a></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>attributes for project agileorbit-cookbooks/java</tt></td>
    <td>&nbsp;</td>
    <td>see: <a href="https://github.com/agileorbit-cookbooks/java">java</a></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>attributes for project opscode-cookbooks/tomcat</tt></td>
    <td>&nbsp;</td>
    <td>see: <a href="https://github.com/opscode-cookbooks/tomcat">tomcat</a></td>
    <td><tt></tt></td>
  </tr>
</table>

## Usage

### bundle-apache-java-tomcat::default

Include `bundle-apache-java-tomcat` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[bundle-apache-java-tomcat::default]"
  ]
}
```

### add to your hosts files

33.33.33.13   bundle-apache-java-tomcat.webapp1.com  bundle-apache-java-tomcat.webapp2.com  bundle-apache-java-tomcat.webapp3.com

### default apache and tomcat web site parameters in attributes/webapps.rb

```json
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
```

### kitchen converge will:

create 2 apache web sites and 1 tomcat web site at the host names above.

## License and Authors

Author:: Stan Towianski (<stashu.pub@gmail.com>)
