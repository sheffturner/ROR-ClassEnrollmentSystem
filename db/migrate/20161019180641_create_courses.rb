class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :major
      t.string :course_num
      t.string :course_name
      t.string :day
      t.string :time
      t.string :room
      t.string :instructor_name

      t.timestamps null: false
    end
  end
end
