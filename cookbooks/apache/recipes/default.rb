#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
         action :install
end

node["apache"]["sites"].each do |sitename, data|
     document_root = "/content/sites/#{sitename}"
     
     directory document_root do
         mode "0755"
         recursive true
      end
end


service "httpd" do
         action [:enable, :start]
end
