#
# Cookbook:: jjb_bootstrap
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'jenkins::master'

package 'python-pip' do
  action :install
end

bash "install pythonie things" do
  user "root"
  cwd "/tmp"
  creates "maybe"
  code <<-EOH
  STATUS=0
  pip install --upgrade pip || STATUS=1
  pip install pyyaml || STATUS=1
  pip install pbr || STATUS=1
  pip install python-jenkins || STATUS=1
  pip install setuptools || STATUS=1
  pip install ordereddict || STATUS=1
  pip install stevedore || STATUS=1
  exit $STATUS
  EOH
end

directory "/jjb/" do
  owner "jenkins"
  group "jenkins"
  mode "0755"

  action :create
end

git "/jjb" do
  repository "https://github.com/openstack-infra/jenkins-job-builder.git"
  reference "master"
  user "jenkins"
  group "jenkins"
  action :checkout
end

bash "python setup of jjb" do
  user "root"
  cwd "/jjb/"
  creates "maybe"
  code <<-EOH
  STATUS=0
  python setup.py install || STATUS=1
  exit $STATUS
  EOH
end

directory "/jjb/etc/" do
  owner "jenkins"
  group "jenkins"
  mode "0755"

  action :create
end

template "/jjb/etc/jenkins_jobs.ini" do
  source "jenkins_jobs.ini.erb"
  owner "jenkins"
  group "jenkins"
  mode "0644"
end

directory "/jjb/jobs/" do
  owner "jenkins"
  group "jenkins"
  mode "0755"

  action :create
end


template "/jjb/jobs/basic.yml" do
  source "basic.yml.erb"
  owner "jenkins"
  group "jenkins"
  mode "0644"
end

template "/jjb/jobs/update_jobs.yml" do
  source "update_jobs.yml.erb"
  owner "jenkins"
  group "jenkins"
  mode "0644"
end

package 'nginx' do
  action :install
end

file "/etc/nginx/sites-enabled/default" do
  owner "jenkins"
  group "jenkins"
  mode "0644"

  action :delete
end

template "/etc/nginx/sites-available/jenkins" do
  source "jenkins.erb"
  owner "jenkins"
  group "jenkins"
  mode "0644"
end

link "/etc/nginx/sites-enabled/jenkins" do
  to "/etc/nginx/sites-available/jenkins"
end

directory "/var/log/nginx/jenkins" do
  owner "jenkins"
  group "jenkins"
  mode "0755"

  action :create
end

service "nginx" do
  supports :status => true, :restart => true, :truereload => true
  action [ :enable, :restart ]
end
