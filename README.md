# EventMachine::EmailServer::Sqlite3

This provides SQLite3-based storage of users and emails for EventMachine::EmailServer

## Installation

Add this line to your application's Gemfile:

    gem 'eventmachine-email_server-sqlite3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventmachine-email_server-sqlite3

## Usage

    require 'eventmachine'
    require 'eventmachine/email_server'
    require 'eventmachine/email_server/sqlite3'
    require 'sqlite3'
    include EventMachine::EmailServer
    s = SQLite3::Database.new("email_server.sqlite3")
    
    # we pass in the same database handle for the Sqlite3UserStore and the Sqlite3EmailStore so that we can keep everything in one database file
    userstore = Sqlite3UserStore.new(s)
    # add a user
    #  first argument is the user's id for the database
    #  second argument is the user's login name
    #  third argument is the user's password
    #  forth argument is the email address that delivers mail to this user
    userstore << User.new(1, "chris", "password", "chris@example.org")
    
    # we pass in the same database handle for the Sqlite3UserStore and the Sqlite3EmailStore so that we can keep everything in one database file
    emailstore = Sqlite3EmailStore.new(s)
    
    EM.run {
      pop3 = EventMachine::start_server "0.0.0.0", 2110, POP3Server, "example.org", userstore, emailstore
      smtp = EventMachine::start_server "0.0.0.0", 2025, SMTPServer, "example.org", userstore, emailstore
    }

## Contributing

1. Fork it ( https://github.com/[my-github-username]/eventmachine-email_server-sqlite3/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
