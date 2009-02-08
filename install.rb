# Install hook code here
require 'fileutils'

FileUtils.mkdir_p RAILS_ROOT+'/db/spark'
Dir.glob(File.join(RAILS_ROOT,"config/environments",'*.{rb}')).each do |env|
  FileUtils.mkdir_p RAILS_ROOT+'/db/spark/'+File.basename(env, '.*')
end

# s3_config = File.dirname(__FILE__) + '/../../../config/amazon_s3.yml'
# FileUtils.cp File.dirname(__FILE__) + '/amazon_s3.yml.tpl', s3_config unless File.exist?(s3_config)
# puts IO.read(File.join(File.dirname(__FILE__), 'README'))