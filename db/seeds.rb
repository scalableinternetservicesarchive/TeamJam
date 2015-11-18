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

User.create([
  {email: "akash5malik@gmail.com", encrypted_password: "$2a$10$Ia0Op0tShf8q8jospAMK6OXdej/lecgDW3Y7qcZd6xhf4hqkPxsYO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 11, current_sign_in_at: "2015-11-05 23:43:47", last_sign_in_at: "2015-11-05 23:38:18", current_sign_in_ip: "71.189.165.212", last_sign_in_ip: "71.189.165.212", created_at: "2015-10-26 02:46:14", updated_at: "2015-11-05 23:43:47", first_name: "Akash", last_name: "Malik", sid: 704332974, major: "Computer Science", year: 3, prof_pic_file_name: nil, prof_pic_content_type: nil, prof_pic_file_size: nil, prof_pic_updated_at: nil, github: nil, prof: false, dependability: nil, reviews: 0},
  {email: "billgates@hotmail.com", encrypted_password: "$2a$10$U.25YNugy9wWtoc0TVVMxOZ2gJbeR0ndccnzP3YWNadVB1JgXPtxa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 22, current_sign_in_at: "2015-11-12 23:35:22", last_sign_in_at: "2015-11-05 23:42:41", current_sign_in_ip: "::1", last_sign_in_ip: "71.189.165.212", created_at: "2015-10-26 02:57:50", updated_at: "2015-11-12 23:35:22", first_name: "Bill", last_name: "Gates", sid: 111222333, major: "Computer Science", year: 4, prof_pic_file_name: "Young-Bill-Gates.jpg", prof_pic_content_type: "image/jpeg", prof_pic_file_size: 70394, prof_pic_updated_at: "2015-10-27 10:16:55", github: nil, prof: false, dependability: nil, reviews: 0},
  {email: "zuckerberg@facebook.com", encrypted_password: "$2a$10$5p8JpkuN2glSBsm3sp5NGu3U/Oow7juSl5iYHCNAnRf0uQKKCGXaa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 25, current_sign_in_at: "2015-11-12 23:30:40", last_sign_in_at: "2015-11-05 23:40:46", current_sign_in_ip: "::1", last_sign_in_ip: "71.189.165.212", created_at: "2015-10-26 06:20:28", updated_at: "2015-11-12 23:30:40", first_name: "Mark", last_name: "Zuckerberg", sid: 555555555, major: "Computer Science", year: 4, prof_pic_file_name: "mark.jpg", prof_pic_content_type: "image/jpeg", prof_pic_file_size: 43591, prof_pic_updated_at: "2015-10-27 10:14:19", github: nil, prof: false, dependability: nil, reviews: 0},
  {email: "uchiha@naruto.com", encrypted_password: "$2a$10$H4hVnfGFeZ2emed9ItdMH.iOVaoPWS9ehqRvVN1fgxosnSaqU4raW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2015-11-05 23:46:33", last_sign_in_at: "2015-11-02 08:06:07", current_sign_in_ip: "71.189.165.212", last_sign_in_ip: "169.232.85.84", created_at: "2015-10-29 04:50:35", updated_at: "2015-11-05 23:46:33", first_name: "Itachi", last_name: "Uchiha", sid: 111111111, major: "Advanced Ninja Studies", year: 3, prof_pic_file_name: nil, prof_pic_content_type: nil, prof_pic_file_size: nil, prof_pic_updated_at: nil, github: nil, prof: false, dependability: nil, reviews: 0},
  {email: "sakura@naruto.com", encrypted_password: "$2a$10$./OfXSg2n2aLHdUbchU15.lidqATBm7pCO7WlXvErkPRL2jYELsPC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 12, current_sign_in_at: "2015-11-05 06:00:11", last_sign_in_at: "2015-11-05 05:59:03", current_sign_in_ip: "169.232.85.84", last_sign_in_ip: "169.232.85.84", created_at: "2015-10-29 05:15:38", updated_at: "2015-11-05 06:00:11", first_name: "Sakura", last_name: "Haruno", sid: 123456789, major: "Sucking ", year: 1, prof_pic_file_name: "Sakura_Haruno.PNG", prof_pic_content_type: "image/png", prof_pic_file_size: 89513, prof_pic_updated_at: "2015-10-29 05:16:56", github: nil, prof: false, dependability: nil, reviews: 0}
  ])

CourseSkillset.create(course_id: 1, skill_id: 1, min_rating: 2)
CourseSkillset.create(course_id: 2, skill_id: 7, min_rating: 1)
CourseSkillset.create(course_id: 2, skill_id: 8, min_rating: 1)
CourseSkillset.create(course_id: 2, skill_id: 9, min_rating: 1)
CourseSkillset.create(course_id: 3, skill_id: 2, min_rating: 2)





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
