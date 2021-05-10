# frozen_string_literal: true

require './mentor'
require './student'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

mentor.task_for_student('HW:05', 'data', student)

student.add_answer('Data1')
student.to_check

mentor.subscribe_to(student)

mentor.add_new_task
student.show_notifications
student.read_notifications

mentor.show_notifications # => []

student.add_answer('Data2')
student.to_check
mentor.show_notifications # => [Notification, ...]

mentor.read_notifications
mentor.show_notifications # => []

student.add_answer('Data3')
student.to_check

mentor.reject_to_work

student.show_notifications
student.read_notifications

student.add_answer('Data4')
student.to_check

mentor.accept_to_work

student.show_notifications
student.read_notifications
