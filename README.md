# flightcrew.io

A job board of major US airlines, planning to expand in the future.

### General

Developer(s): [@sbambey](https://github.com/sbambey)

The most recent version is currently maintained at [https://safe-forest-2459.herokuapp.com/](https://safe-forest-2459.herokuapp.com/).

Feel free to make an account. If you would like admin access, drop me a line at <a href="mailto:sbambey@gmail.com">sbambey@gmail.com</a>

### Overview

The application has two major components:

1. Managing users, airlines and their opportunities (Admin, User, Airline, Fly models)
2. Automatically determining the consistency of opportunities with the use of rake tasks (ScrapeNodeSet, ScrapeNode, AdminNotice models)

### Testing

The first major component is fully tested, while the second is not fully tested. At the moment the second component is at a stage where it is not certain what the final implementation will look like. TDD is delayed until it becomes more clear what the implementation will entail.

### Future plans

Currently a matching algorithm is being worked on that matches users to opportunities, given the flight hours of the user and the requirements of the opportunity.

### Questions?

Don't hesitate to drop me a line at <a href="mailto:sbambey@gmail.com">sbambey@gmail.com</a>