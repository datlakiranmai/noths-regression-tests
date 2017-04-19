require 'fileutils'
require 'cucumber/rake/task'
require 'yaml'


ENV['TEST_NO'] ||= '~@wip'

Cucumber::Rake::Task.new(:firefox) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=FIREFOX_OSX_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:chrome) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=CHROME_OSX_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:ie) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=IE_WIN_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

Cucumber::Rake::Task.new(:safari) do |t,args|
  t.cucumber_opts = "BROWSER_OPT=SAFARI_OSX_10 ENV_ID=#{ENV['ENV_ID']} features/ --tag #{ENV['TEST_NO']}"
end

multitask :all => [:firefox,:chrome,:ie,:safari]

Rake::Task[:all].invoke




