# Problem Statement

As a user of net-ssh-gateway, I expect to be able to make multiple outgoing
connections through a single gateway connection. In it's current state, there
is an edge cases that breaks this ability.

# Assumptions
  1. An `ssh daemon` running on localhost
  2. Credentials
    - You have an `ssh key` setup for the current user
    - You've updated the scripts with an appropriate `username/password`
  3. There are no services listening on `localhost:1234`

# Scripts

  - `working.rb` A successful request to `example.com` through a gateway to `localhost`
  - `bug.rb` A timed out request to `example.com` through a gateway after a timed out request to a nonexistent service on `localhost:1234`
  - `workaround.rb` Demonstration that making a new gateway after the initial time out resolves the issue

# Things to Note
  - Attempting to shutdown a gateway that has made a request over a bad gateway connection raises an exception due to the stream being closed
  - Interestingly, if you don't do any actual work over the bad port, the issue does not present itself.
