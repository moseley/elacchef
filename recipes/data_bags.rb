instance = search("aws_opsworks_instance").first
Chef::Log.info("********** AWS OpsWorks Instance")
instance.each do |content|
  Chef::Log.info("********** #{content} **********")
end

layer = search("aws_opsworks_layer").first
Chef::Log.info("********** AWS OpsWorks Layer")
layer.each do |content|
  Chef::Log.info("********** #{content} **********")
end

stack = search("aws_opsworks_stack").first
Chef::Log.info("********** AWS OpsWorks Stack")
stack.each do |content|
  Chef::Log.info("********** #{content} **********")
end
