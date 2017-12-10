# Shipping Tracker

This web app allows a user to track shipments from multiple senders. A user can signup/login to the app and see a list of all their shipments. From there a signed in user can add more packages to their list, edit current packages, or delete packages. They can also see shipments organized by sender.

## Installation

Download the repo, cd into the directory then run

```ruby
bundle install
rake db:migrate
```

And then run either:

```ruby
shotgun
```

or:

```ruby
rackup config.ru
```

and point your browser to the address given (like 127.0.0.1:9393 or localhost:9292)

## Usage

This is a project to demo a sinatra app using an ActiveRecord database.

## Development
