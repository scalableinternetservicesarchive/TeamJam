# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
courses = Course.create([
    {name: 'CS143', description: "Database Systems", max_members: 2 }, {name: 'CS188', description: "Scalable Internet Services", max_members: 4 },{name: 'CS118', description: "Networking", max_members: 2 }, {name: 'CS174A', description: "Computer Graphics", max_members: 5 }, {name: 'CS130', description: "Software Engineering", max_members: 4 }
  ])
=end

=begin
courses = Course.all
teams = Team.create([
  {name: 'TeamUp', description: "Automatic Team Selector", course_id: courses[1].id},
  {name: 'EasyPay', description: "Payment with bitcoin", course_id: courses[1].id},
  {name: 'HuMATH', description: "Calculator for HuManities students", course_id: courses[3].id},
  {name: 'DashDash', description: "Complete Autocomplete Unix Shell", course_id: courses[4].id}
  ])
  =end
=begin
["C++", "Python", "C", "Java", "iOS", "Android", "JavaScript", "Backend", "Frontend"].each do |sk|
  Skill.create(name: sk)
end

when the user sees the list of teams, he should see the express interest option, and that should notify the owners and other
members about that persons interest. We also need a dedicated team mailbox, and message should go into that mailbox and everybody in the team. Then, the team owner should be able to add that team member or reject him, and then also replace a current member with the other one, and for any change in the team configuration, all team members should be notified. the message should include a link to his profile. How to add or reject a member ? sending a custom message...

not sure how to add skills .... it could be scale(Expert, Proficient, Experienced, Some Experience, n00b)
okay scale it is, but now how to combine individual skills to get team skill? And how does the instructor select the
minimum skill requirement ?


send message...
current_user.send_message(team_owner, "I would like to join your team");
team_owner=> adds a person to the team, or sends a message rejecting...

invite => join or reject..
offer => accept or deny...

1) can notify the team members, but how to display the notifications to them ? maybe current_user.mailbox.notifications.yup.How to get their body ?

design for notifications:
1. create notification controller, and the routes should be independent, always use current_user
2. actions: index, accept, deny, reject...
since there are different kinds of notifs( reponse notice has no actions), only request notice has actions. so for notifs,
if the type is 1(team join request), or 3(team_join invitation)
for 1, the buttons are = accept, deny
for 3, the buttons are = accept, reject
for 2, 4, there are no buttons.
for accept button, it links to accept controller, which if the code is 1, adds the user to the team if space is available and the user is not in any other team as of now...,
and if it is reject, then it sends back a suitable message....
=end
# create associations
#user = User.first
#team = Team.first
#course = Course.first
 #membership = TeamMembership.create(user_id: user.id, team_id: team.id)
#team1 = Team.find(3)
#membership1 = TeamMembership.create(user_id: user.id, team_id: team1.id)
#course = Course.find(2)
#enrollment = Enrollment.create(course_id: course.id, user_id: user.id)
#course = Course.find(4)
#enrollment = Enrollment.create(course_id: course.id, user_id: user.id)
#course = Course.find(3)
#enrollment = Enrollment.create(course_id: course.id, user_id: user.id)
