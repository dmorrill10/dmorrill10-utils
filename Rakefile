#!/usr/bin/env rake

require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'

require File.expand_path('../lib/dmorrill10-utils/version', __FILE__)

Rake::TestTask.new do |t|
  t.libs << "lib" << 'spec/support'
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
  t.warning = true
end

desc 'Build gem'
task :default => :build

task :build => :spec do
  system "gem build dmorrill10-utils.gemspec"
end

task :tag => :build do
  puts "Tagging #{AcpcPokerTypes::VERSION}..."
  system "git tag -a #{AcpcPokerTypes::VERSION} -m 'Tagging #{AcpcPokerTypes::VERSION}'"
  puts "Pushing #{AcpcPokerTypes::VERSION} to git..."
  system "git push --tags"
end
