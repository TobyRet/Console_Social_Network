# Console-based Social Network

This application runs a simple console-based social network. The funcitonality provided is similiar to Twitter.

Upon load, three user profiles are automatically created (Alice, Bob and Charlie).


### To run the application

1. Clone this repo
2. Bundle install
3. In the console run `irb -Ilib -rrun`

### Console commands

1. Post a message: (user name) -> (message)
2. Read another person's messages: (user name)
3. Follow another user: (user name) <em>follows</em> (another user)
4. Read another user's feed (messages plus subscriptions): (user name) <em>wall</em>

### Areas for Improvement & Challenges

1. Freezing time... It was my first time using the Timecop gem and I only scraped the surface in terms of what it can do. I think this is an area I would benefit from further practice. 

2. Testing the user's interaction with the console. I've previously used Capybara to test user interaction with the browser, but got a little stumped when it came to coming up with a practical way to test the user's interaction with the console. Any pointers here would be greatly appreciated :-)

3. I will revisit the code and refactor where possible.


### Known Bugs
1. Time stamp needs to be singularized when post is less than a minute old




