require 'spec_helper'

#services we expect to be running
base_services = ['apache2']

base_services.each do |s|
  describe service(s) do
    it { should be_running }
  end
end

base_packages = ['vim', 'git', 'curl']

base_packages.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

php_mods = ['gd', 'mysql', 'curl', 'mcrypt']

php_mods.each do |mod|
  describe command("php -m | grep #{mod}") do
      its(:stdout) { should match mod }
  end
end

describe command("php -v") do
  its(:stdout) { should match /PHP 5.4/}
end
