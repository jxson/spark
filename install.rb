require 'fileutils'

FileUtils.mkdir_p RAILS_ROOT+'/db/spark'
Dir.glob(File.join(RAILS_ROOT,"config/environments",'*.{rb}')).each do |env|
  FileUtils.mkdir_p RAILS_ROOT+'/db/spark/'+File.basename(env, '.*')
end