SPARK_ROOT = File.join(RAILS_ROOT, "db/spark")

desc "Loads spark fixtures then runs spark scripts"
task :spark => ['spark:fixtures','spark:scripts']

namespace :spark do
  desc "Loads all fixtures in db/spark/fixtures"
    task :fixtures => [:environment,'db:reset'] do
    require 'active_record/fixtures'
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    SPARK_FIXTURES_ROOT = File.join(SPARK_ROOT,RAILS_ENV)
    Dir.glob(File.join(SPARK_FIXTURES_ROOT,'*.yml')).each do |file|
      file_name = File.basename(file, '.*')
      count = begin
                res = Fixtures.create_fixtures(SPARK_FIXTURES_ROOT,file_name)
                res.size rescue 1 # 1 for the case where the res is the sole record inserted, not a list
              end
      puts "Loaded #{count} into #{file_name.camelcase}"
    end
  end

	desc 'Runs all spark scripts in db/spark/RAILS_ENV/scripts'
	task :scripts => [:environment,'db:reset'] do
		include Spark::Mixins
		Dir.glob(File.join(RAILS_ROOT, "db/spark/#{RAILS_ENV}", '*.{rb}')).each { |script_file| require script_file }
	end
end
