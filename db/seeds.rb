Course.create!([
  {name: "Writting Emails", user_id: 1, max_number: 25, min_number: 20, series: false, start_date: nil, end_date: nil, cover: "https://cdn2.iconfinder.com/data/icons/New-Social-Media-Icon-Set-V11/512/email.png", long_description: "Join this class and learn how to write professional emails.", short_description: "Join this class and learn how to write professional emails.", short_name: nil},
  {name: "Website Design", user_id: 1, max_number: 25, min_number: 20, series: false, start_date: nil, end_date: nil, cover: "https://giasutoeic.com/static/Vocabulary/images/topic_images/computers.png", long_description: "Learn how to design a website in a four weeks class", short_description: "Learn how to design a website in a four weeks class", short_name: nil},
  {name: "Introduction to Blogging", user_id: 1, max_number: 25, min_number: 20, series: false, start_date: nil, end_date: nil, cover: "http://contentmarketingup.com/wp-content/uploads/2016/06/create.png", long_description: "Join this class and learn how to create a blog in four weeks!", short_description: "Join this class and learn how to create a blog in four weeks!", short_name: nil},
  {name: "Data Management", user_id: 2, max_number: 30, min_number: 25, series: false, start_date: "2017-04-19 00:00:00", end_date: "2017-09-19 00:00:00", cover: "http://hemsmail.com/wp-content/uploads/2015/03/data-management-icon.png", long_description: "There are many different ways to organize data, and many employers use different systems. In this module, you will learn how to organize many types of data securely so that you can adapt to the system wherever you end up working.", short_description: "In this module, you will learn how to organize many types of data securely", short_name: "Data Management"}
])
CourseDepartment.create!([
  {course_id: 1, department_id: 1},
  {course_id: 2, department_id: 2},
  {course_id: 3, department_id: 1},
  {course_id: 4, department_id: 1}
])
Department.create!([
  {name: "Technology", user_id: 1},
  {name: "Communications", user_id: 1}
])
Role.create!([
  {name: "admin"},
  {name: "teacher"},
  {name: "student"},
  {name: "observer"}
])
Room.create!([
  {name: "Gasabo", capacity: 100, user_id: 1}
])
Status.create!([
  {name: "Pending"},
  {name: "Accepted"},
  {name: "Rejected"},
  {name: "Waitlisted"}
])
Student.create!([
  {user_id: 4, class_level: "Level 3"}
])
StudentCourse.create!([
  {student_id: 1, course_id: 1, status_id: 1},
  {student_id: 1, course_id: 4, status_id: 1}
])
Teacher.create!([
  {user_id: 2, title: "Lead Course Facilitator"},
  {user_id: 3, title: "Course Facilitator"}
])
TeacherCourse.create!([
  {teacher_id: 2, course_id: 1},
  {teacher_id: 2, course_id: 4}
])
User.create!([
  {role_id: 1, password_digest: "$2a$10$WDuny/z/GgTt47B1FFLZwu37Gj52Xaoc4DnIRB.VT7ct5g/thCrEK", first_name: "Salomon", last_name: "Beza", bio: "Salomon is a full-stack programmer, best known for the creation of the app Register. He works for Kepler as the Information Systems Officer.", photo: "http://www.kepler.org/images/team-updated/salomon-beza.jpg", phone_number: "+250788380958", email_address: "salomon@kepler.org", birthdate: "1992-04-26 00:00:00"},
  {role_id: 2, password_digest: "$2a$10$1kzc.9AYF/bdn0/IrhjexeCnj0ltiitzSiLD6Pvj1cLfjaHVreAXK", first_name: "Obed", last_name: "Bigirimana", bio: "Course Facilitator at Kepler.", photo: "http://www.kepler.org/images/team-updated/obed-bigirimana.jpg", phone_number: "07879809890", email_address: "obed@kepler.org", birthdate: "1988-11-23 00:00:00"},
  {role_id: 3, password_digest: "$2a$10$r3ubduvMw0es7zU2HX8NCOgxrZvaubGhY24oWZsWkxXn7koE3J7Ru", first_name: "Test", last_name: "Account", bio: "This account is used to test features.", photo: "http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons-256/3d-glossy-blue-orbs-icons-signs/088986-3d-glossy-blue-orb-icon-signs-test-tube.png", phone_number: "0000000000", email_address: "test@register.com", birthdate: "1990-01-01 00:00:00"},
  {role_id: 2, password_digest: "$2a$10$P3DZgi46N3FzuHTRx9kCFOMTCLTHZPlLZbg4LmpDYVkOMpb49W43i", first_name: "Karoli", last_name: "Kolokonyi", bio: "Course Facilitator at Kepler", photo: "http://www.kepler.org/team/karoli-kolokonyi.html", phone_number: "0788", email_address: "karoli@kepler.org", birthdate: "1993-02-22 00:00:00"}
])
