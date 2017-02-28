instance = search("aws_opsworks_instance").first
os = instance["os"]

if os == "Red Hat Enterprise Linux 7"
  Chef::Log.info("********** Operating system is Red Hat Enterprise Linux. **********")
elsif os == "Ubuntu 12.04 LTS" || os == "Ubuntu 14.04 LTS" || os == "Ubuntu 16.04 LTS"
  Chef::Log.info("********** Operating system is Ubuntu. **********") 
elsif os == "Microsoft Windows Server 2012 R2 Base"
  Chef::Log.info("********** Operating system is Windows. **********")
elsif os == "Amazon Linux 2015.03" || os == "Amazon Linux 2015.09" || os == "Amazon Linux 2016.03" || os == "Amazon Linux 2016.09"
  Chef::Log.info("********** Operating system is Amazon Linux. **********")
elsif os == "CentOS Linux 7"
  Chef::Log.info("********** Operating system is CentOS 7. **********")
else
  Chef::Log.info("********** Cannot determine operating system. **********")
end

case os
when "Amazon Linux 2015.03", "Amazon Linux 2015.09", "Amazon Linux 2016.03", "Amazon Linux 2016.09", "Red Hat Enterprise Linux 7", "CentOS Linux 7"
  yum_package "Install Apache 2.4 package with yum" do
    package_name "httpd24"
  end
  yum_package "Install PHP 7 package with yum" do
    package_name "php70"
  end
  yum_package "Install PHP 7 MySQL with yum" do
    package_name "php70-mysqlnd"
  end
  yum_package "Install PHP 7 MB String with yum" do
    package_name "php70-mbstring"
  end
  yum_package "Install Mod SSL with yum" do
    package_name "mod_ssl"
  end

  service "httpd" do 
    action [:enable, :start]
  end
else
  Chef::Log.info("********** Cannot determine operating system type, or operating system is not Linux. Package not installed. **********")
end