# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eventmachine/email_server/sqlite3/version'

Gem::Specification.new do |spec|
  spec.name          = "eventmachine-email_server-sqlite3"
  spec.version       = EventMachine::EmailServer::Sqlite3::VERSION
  spec.authors       = ["chrislee35"]
  spec.email         = ["rubygems@chrislee.dhs.org"]
  spec.summary       = %q{SQLite3 backend store for eventmachine-email_server}
  spec.description   = %q{This provides the implementation of a user and email store for an EventMachine-based SMTP and POP3 server.}
  spec.homepage      = "https://github.com/chrislee35/eventmachine-email_server-sqlite3/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "eventmachine-email_server", "~> 0.0.5"
  spec.add_runtime_dependency "sqlite3", ">= 1.3.6"
  spec.add_development_dependency "eventmachine", ">= 0.12.10"
  spec.add_development_dependency "minitest", "~> 5.5"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
