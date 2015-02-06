#
# Cookbook Name:: bundle-apache-java-tomcat
# Recipe:: default
#
# Copyright (C) 2015 Stan Towianski
#
# All rights reserved
#

puts ""
puts "ZZZ bundle pre webapp__apache_docroot =" + "#{node['bajt']['apache']['docroot']}" + "="
puts "ZZZ bundle pre webapp_________docroot =" + "#{node['bajt']['apache']['docroot']}" + "="
puts ""

include_recipe "bundle-apache-java-tomcat::apache2"
include_recipe "iptables::disabled"
include_recipe "bundle-apache-java-tomcat::java"
include_recipe "bundle-apache-java-tomcat::tomcat"
#include_recipe "bundle-apache-java-tomcat::apache-install-webapps-old"
include_recipe "bundle-apache-java-tomcat::apache-install-webapps"
include_recipe "bundle-apache-java-tomcat::tomcat-install-webapps"

puts ""
puts "ZZZ bundle post webapp__apache_docroot =" + "#{node['bajt']['apache']['docroot']}" + "="
puts "ZZZ bundle post webapp_________docroot =" + "#{node['bajt']['apache']['docroot']}" + "="
puts ""

