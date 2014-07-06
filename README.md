# Console-based Social Network

This application runs a simple console-based social network. The funcitonality provided is similiar to Twitter.


### To run the application

1. Clone this repo
2. Bundle install
3. In the console run `irb -Ilib -rrun`

### Console commands

1. Post a message: (user name) -> (message)
2. Read another person's messages: (user name)
3. Follow another user: (user name) <em>follows</em> (another user)
4. Read another user's feed (messages plus subscriptions): (user name) <em>wall</em>

### Updates 1 July 2014

1. Timecop gem now correctly freezing time for rspec tests
2. Posts now returning correctly formatted timestamps (minutes ago or seconds ago)
3. User and Action class combined
4. Factories created for users

### Updates 6 July 2014
1. Posts are listed by most recent in wall and timeline
2. Timecop #travel method now used to displace time
3. #puts methods extracted to run.rb

### To do
1. Refactor run.rb




