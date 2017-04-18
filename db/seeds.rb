Course.create!([
  {name: "Introduction to JavaScript", user_id: 1, max_number: 30, min_number: 25, series: false, start_date: "2017-05-05 00:00:00", end_date: "2017-05-07 00:00:00", cover: "http://www.devacron.com/wp-content/uploads/2013/08/jsicon.png", long_description: "Learn basic JavaScript skills in 4 weeks.", short_description: "Learn basic JavaScript skills in 4 weeks.", short_name: "Intro to JavaScript"},
  {name: "Introduction to Sales", user_id: 1, max_number: 30, min_number: 25, series: false, start_date: "2017-05-05 00:00:00", end_date: "2017-05-07 00:00:00", cover: "http://cdn2.hubspot.net/hub/26849/file-2061370810-png/sales-and-marketing-retention-icon.png", long_description: "Sales is a key part of many jobs, and is where many entrepreneurs get their start. In this module, you'll learn the key ways to persuade people to buy your product, and practice your presentation skills as well. Even if you don't want to end up in sales, learning to be persuasive, charming and \"how to get your foot in the door\" are essential professional competencies.", short_description: " In this module, you'll learn the key ways to persuade people to buy your product, and practice your presentation skills as well.", short_name: "Introduction to Sales"},
  {name: "Website Design", user_id: 1, max_number: 25, min_number: 20, series: false, start_date: nil, end_date: nil, cover: "https://giasutoeic.com/static/Vocabulary/images/topic_images/computers.png", long_description: "Learn how to design a website in a four weeks class", short_description: "Learn how to design a website in a four weeks class", short_name: nil},
  {name: "Data Management", user_id: 2, max_number: 30, min_number: 25, series: false, start_date: "2017-04-19 00:00:00", end_date: "2017-09-19 00:00:00", cover: "http://hemsmail.com/wp-content/uploads/2015/03/data-management-icon.png", long_description: "There are many different ways to organize data, and many employers use different systems. In this module, you will learn how to organize many types of data securely so that you can adapt to the system wherever you end up working.", short_description: "In this module, you will learn how to organize many types of data securely", short_name: "Data Management"},
  {name: "Writting Emails", user_id: 1, max_number: 25, min_number: 20, series: false, start_date: "2017-11-12 00:00:00", end_date: "2018-02-12 00:00:00", cover: "https://cdn2.iconfinder.com/data/icons/New-Social-Media-Icon-Set-V11/512/email.png", long_description: "Join this class and learn how to write professional emails.", short_description: "Join this class and learn how to write professional emails.", short_name: nil},
  {name: "Introduction to Blogging", user_id: 1, max_number: 25, min_number: 20, series: false, start_date: nil, end_date: nil, cover: "http://contentmarketingup.com/wp-content/uploads/2016/06/create.png", long_description: " Join this class and learn how to create a blog in four weeks!", short_description: "Join this class and learn how to create a blog in four weeks!", short_name: "Blogging"},
  {name: "Public Speaking", user_id: 3, max_number: 25, min_number: 20, series: false, start_date: "2017-04-05 00:00:00", end_date: "2017-05-07 00:00:00", cover: "http://www.corteccia.net/PNBC-Cyprus/assets/img/preview/S11.png", long_description: "Learn Public Speaking in a 4 weeks modular class", short_description: "Learn Public Speaking in a 4 weeks modular class", short_name: "Public Speaking"}
])
CourseDepartment.create!([
  {course_id: 2, department_id: 2},
  {course_id: 3, department_id: 1},
  {course_id: 4, department_id: 1},
  {course_id: 1, department_id: 1},
  {course_id: 9, department_id: 2},
  {course_id: 10, department_id: 1},
  {course_id: 11, department_id: 3}
])
Department.create!([
  {name: "Technology", user_id: 1},
  {name: "Communications", user_id: 1},
  {name: "Professional Competencies", user_id: 1}
])
Role.create!([
  {name: "admin"},
  {name: "teacher"},
  {name: "student"},
  {name: "observer"}
])
Room.create!([
  {name: "Nyagatare", capacity: 25, user_id: 1},
  {name: "Gasabo", capacity: 100, user_id: 1}
])
Status.create!([
  {name: "Pending"},
  {name: "Accepted"},
  {name: "Rejected"},
  {name: "Waitlisted"}
])
Student.create!([
  {user_id: 4, class_level: "Level 3"},
  {user_id: 6, class_level: "Level 3"},
  {user_id: 7, class_level: nil},
  {user_id: 5, class_level: "Level 1"},
  {user_id: 8, class_level: nil}
])
StudentCourse.create!([
  {student_id: 3, course_id: 3, status_id: 2},
  {student_id: 2, course_id: 3, status_id: 3},
  {student_id: 2, course_id: 4, status_id: 3},
  {student_id: 3, course_id: 1, status_id: 2},
  {student_id: 2, course_id: 1, status_id: 2},
  {student_id: 5, course_id: 2, status_id: 2},
  {student_id: 2, course_id: 11, status_id: 2},
  {student_id: 2, course_id: 9, status_id: 2},
  {student_id: 2, course_id: 10, status_id: 1},
  {student_id: 4, course_id: 4, status_id: 2},
  {student_id: 2, course_id: 2, status_id: 2}
])
Teacher.create!([
  {user_id: 2, title: "Lead Course Facilitator"},
  {user_id: 3, title: "Course Facilitator"}
])
TeacherCourse.create!([
  {teacher_id: 2, course_id: 1},
  {teacher_id: 2, course_id: 4},
  {teacher_id: 2, course_id: 2},
  {teacher_id: 2, course_id: 11},
  {teacher_id: 2, course_id: 9},
  {teacher_id: 2, course_id: 10},
  {teacher_id: 2, course_id: 3}
])
User.create!([
  {role_id: 1, password_digest: "$2a$10$WDuny/z/GgTt47B1FFLZwu37Gj52Xaoc4DnIRB.VT7ct5g/thCrEK", first_name: "Salomon", last_name: "Beza", bio: "Salomon is a full-stack programmer, best known for the creation of the app Register. He works for Kepler as the Information Systems Officer.", photo: "http://www.kepler.org/images/team-updated/salomon-beza.jpg", phone_number: "+250788380958", email_address: "salomon@kepler.org", birthdate: "1992-04-26 00:00:00"},
  {role_id: 2, password_digest: "$2a$10$1kzc.9AYF/bdn0/IrhjexeCnj0ltiitzSiLD6Pvj1cLfjaHVreAXK", first_name: "Obed", last_name: "Bigirimana", bio: "Course Facilitator at Kepler.", photo: "http://www.kepler.org/images/team-updated/obed-bigirimana.jpg", phone_number: "07879809890", email_address: "obed@kepler.org", birthdate: "1988-11-23 00:00:00"},
  {role_id: 3, password_digest: "$2a$10$r3ubduvMw0es7zU2HX8NCOgxrZvaubGhY24oWZsWkxXn7koE3J7Ru", first_name: "Test", last_name: "Account", bio: "This account is used to test features.", photo: "http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons-256/3d-glossy-blue-orbs-icons-signs/088986-3d-glossy-blue-orb-icon-signs-test-tube.png", phone_number: "0000000000", email_address: "test@register.com", birthdate: "1990-01-01 00:00:00"},
  {role_id: 2, password_digest: "$2a$10$P3DZgi46N3FzuHTRx9kCFOMTCLTHZPlLZbg4LmpDYVkOMpb49W43i", first_name: "Karoli", last_name: "Kolokonyi", bio: "Course Facilitator at Kepler", photo: "http://www.kepler.org/team/karoli-kolokonyi.html", phone_number: "0788", email_address: "karoli@kepler.org", birthdate: "1993-02-22 00:00:00"},
  {role_id: 3, password_digest: "$2a$10$1t8B223gU5zQw/625SP2p.mXLDhxTwTbhYrAKQ7kc6m2fnuccj64i", first_name: "Jean Luc", last_name: "Abayo", bio: "Student at Kepler", photo: "", phone_number: "00000000000", email_address: "jeanluc.abayo2015@kepler.org", birthdate: nil},
  {role_id: 3, password_digest: "$2a$10$.uCTr99JMKAFTj8rlunFNeW0eJWPKX4jPlrcKkuVocGxn2z1luXlm", first_name: "Eugene", last_name: "Niyitanga", bio: "Student at Kepler", photo: "", phone_number: "00000000000", email_address: "eugene.niyitanga2015@kepler.org", birthdate: "1995-12-11 00:00:00"},
  {role_id: 3, password_digest: "$2a$10$86QSw0/gAxZY0R5A2.VRruz1SV1RyA5FbvHE6VmKn0P/.3CByKcNC", first_name: "Test", last_name: "Student", bio: "Test student", photo: "http://www.clker.com/cliparts/A/Y/O/m/o/N/placeholder-md.png", phone_number: "11111111111111", email_address: "student@register.com", birthdate: nil},
  {role_id: 3, password_digest: "$2a$10$okUTNGdYtoicQmv9g4Ydzur/DzuAGxPjzpKjsoEEK.pJBZmmb3AFS", first_name: "Lauren", last_name: "Milewski", bio: "", photo: "", phone_number: "", email_address: "lauren@kepler.org", birthdate: nil}
])
