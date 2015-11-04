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
CourseSkillset.create(course_id: 1, skill_id: 1, min_rating: 2, weight: 0.2)
CourseSkillset.create(course_id: 2, skill_id: 7, min_rating: 1, weight: 0.3)
CourseSkillset.create(course_id: 2, skill_id: 8, min_rating: 1, weight: 0.1)
CourseSkillset.create(course_id: 2, skill_id: 9, min_rating: 1, weight: 0.2)
CourseSkillset.create(course_id: 3, skill_id: 2, min_rating: 2, weight: 0.5)





courses = Course.all
teams = Team.create([
  {name: 'TeamUp', description: "Automatic Team Selector", course_id: courses[1].id},
  {name: 'EasyPay', description: "Payment with bitcoin", course_id: courses[1].id},
  {name: 'HuMATH', description: "Calculator for HuManities students", course_id: courses[3].id},
  {name: 'DashDash', description: "Complete Autocomplete Unix Shell", course_id: courses[4].id}
  ])


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
