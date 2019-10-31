### Gym

A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

#### Inspired By

[Glofox](https://www.glofox.com/club-solution/), [Pike13](https://www.pike13.com/pike13-scheduling-software-demo)

##### Caution

You might try to create a Ruby class named `Class` - this is a reserved word in Ruby, so you will have to name your class `GymClass`, or similar.

#### User Stories - MVP

| As a  | I want to be able to  | So that |
|---|---|---|
| Gym Manager | Manage the list of members | I am storing up-to-date information about members |
| Gym Manager | Manage the list of classes | I have up to date information about what classes are available |
| Gym Manager | Add a user to a class | I can book their place |
| Gym Manager | View all members assigned to a class| I can see which classes are going to be busy |

#### Acceptance Criteria - MVP

Gym managers should be able to
* Create members
* Edit members
* Create classes
* Delete classes
* Assign members to classes
* View a list of classes
* See the members that will be attending each class

#### User Stories - Possible Extensions

| As a  | I want to be able to  | So that |
|---|---|---|
| Gym Manager | Assign a maximum capacity to a class | The class can't be over-booked |
| Gym Manager | Mark members as having "Premium Membership" | I can maximise revenue |

#### Acceptance Criteria - Possible Extensions:

Gym managers should be able to
* Give each class a maximum capacity<br />
* Only assign members until the maximum capacity is reached
* Assign premium membership to members
* Assign a time to a class
* Assign only premium members to classes that take place during peak hours. (7-9am, 5-8pm)
