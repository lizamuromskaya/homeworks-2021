# frozen_string_literal: true

require './mentor'
require './student'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

student.to_work('HW:05', 'data')
student.add_answer
student.to_check
student.all_homeworks # => [Homework, ...]

mentor.subscribe_to(student)
mentor.notifications # => []

student.to_work('HW:05', 'more data')
student.add_answer
student.to_check
mentor.notifications # => [Notification, ...]

mentor.read_notifications
mentor.notifications # => []

student.to_work('HW:05', 'one more data')
student.add_answer
student.to_check

mentor.reject_to_work

student.notifications
student.read_notifications

student.to_work('HW:05', 'date after rewriting')
student.add_answer
student.to_check

mentor.accept_to_work

student.notifications
student.read_notifications
