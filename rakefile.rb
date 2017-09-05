require 'cucumber/rake/task'
require 'rake'
require 'site_prism'



c = Cucumber::Rake::Task.new(:scenario)

task :run_tests, :test_no, :times do |t, args|
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