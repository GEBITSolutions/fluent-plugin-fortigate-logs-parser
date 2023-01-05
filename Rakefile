#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"

task :test => [:base_test]

desc "Run test_unit based test"
Rake::TestTask.new(:base_test) do |t|
  t.libs << "test"
  t.test_files = Dir["test/test*.rb"]
  t.verbose = false
  t.warning = true
end