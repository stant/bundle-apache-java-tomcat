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

## License and Authors

Author:: Stan Towianski (<stashu.pub@gmail.com>)
