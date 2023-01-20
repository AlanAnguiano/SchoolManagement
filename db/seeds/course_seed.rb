default_courses = ['Spanish','Math','Chemistry', 'History']

default_courses.each do |subject|
  Course.find_or_create_by(course_name: subject)
end