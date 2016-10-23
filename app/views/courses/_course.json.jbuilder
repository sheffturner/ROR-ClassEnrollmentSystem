json.extract! course, :id, :major, :course_num, :course_name, :day, :time, :room, :instructor_name, :created_at, :updated_at
json.url course_url(course, format: :json)