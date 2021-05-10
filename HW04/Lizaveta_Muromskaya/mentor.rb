# frozen_string_literal: true

require './human'
# The class that is responsible for the mentor's actions
class Mentor < Human
  private

  attr_reader :students

  public

  def initialize(name:, surname:)
    super
    @students = []
    @notifications = []
  end

  def subscribe_to(student)
    student.mentors << self
    @students << student
  end

  def task_for_student(title, data, student)
    homework = Homework.new(title: title, data: data, student: student)
    student.to_work(homework)
  end

  def add_new_task
    notification = Notification.new(message: 'Add a new task!')
    @students.each do |student|
      student.notifications << notification
    end
  end

  def reject_to_work
    notification = Notification.new(message: 'Rejected!')
    @students.each do |student|
      student.notifications << notification
    end
  end

  def accept_to_work
    notification = Notification.new(message: 'Accepted!')
    @students.each do |student|
      student.notifications << notification
    end
  end
end
