require 'cucumber/rake/task'
require 'rake'
require 'site_prism'

c = Cucumber::Rake::Task.new(:scenario)

task :run_tests_n_numberoftimes, :test_no, :times do |t, args|
  c.cucumber_opts = "features --format AllureCucumber::Formatter --out --guess --format progress --format html --out=features_report.html --tag #{args[:test_no]}"
  args[:times].to_i.times {
    begin
      count ||=2
      Rake::Task[:scenario].execute
    rescue Exception => e
      retry unless (count -= 1).zero?
    end
  }
end

task :stop_execution_upon_first_testfailure, :test_no, :times do |t, args|
  c.cucumber_opts = "features --format AllureCucumber::Formatter --out --guess --format progress --format html --out=features_report.html --tag #{args[:test_no]}"
  args[:times].to_i.times {
      p "Iteration No:  #{args[:times].to_i}"
      Rake::Task[:scenario].execute
  }
end

task :cognito_parallel_tests, [:job_number, :total_jobs] do |_t, args|
  unless args.job_number || args.total_jobs
    raise "You must supply a job number and the total number of jobs"
  end

  job_number = args.job_number.to_i
  total_jobs = args.total_jobs.to_i

  features_list = CognitoTestList.new(job_number, total_jobs)

  puts "RUNNING JOB NUMBER #{job_number} out of #{total_jobs} total jobs."
  puts "FEATURES: #{features_list}"
  puts "EXECUTING WITH: bundle exec cucumber -p cog_e2e $(FEATURES)"

  ok = system("bundle exec cucumber -p cog_e2e #{features_list}")
  raise("Failed to execute cucumber steps") unless ok
end

class CognitoTestList
  def initialize(job_number, total_jobs)
    @test_list = TestSplitter.new(test_files, total_jobs).chunk_for(job_number)
  end

  def to_s
    @test_list
  end

  def test_files
    Dir["features/cognito/**/*.feature"]
  end
end

class TestSplitter
  def initialize(test_files, total_jobs)
    require "parallel_tests/test/runner" # only available in test and development
    require "parallel_tests/grouper"
    @test_chunks = ParallelTests::Test::Runner.tests_in_groups(test_files, total_jobs)
  end

  def chunk_for(job_number)
    @test_chunks[job_number - 1].join(" ")
  end
end
