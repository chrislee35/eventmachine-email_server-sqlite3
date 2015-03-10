#!/usr/bin/env rake
# coding: utf-8

require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << 'lib'
	t.test_files = FileList['test/test_*.rb']
	t.verbose = true
end

task :default => :test