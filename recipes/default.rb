# # Cookbook Name:: web-base
# Recipe:: default
#
# Copyright 2014, Kyle Nehring
#
# All rights reserved - Do Not Redistribute
#

# Makes sure apt is up to date
include_recipe "apt::default"

#create users
node['web-base']['user'].each do |user, user_hash|
  web_user user do
    action   :create
    ssh_keys user_hash['ssh_keys']
  end  
end

#group "admin" do
  #action :create
#end

include_recipe "apache2::default"
include_recipe "apache2::mod_rewrite"

# Add repositories
apt_repository "php54" do
  uri "http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "E5267A6C"
end

# Install Php5.4
include_recipe "php"
include_recipe "apache2::mod_php5"

#Install Packages
node['web-base']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end


