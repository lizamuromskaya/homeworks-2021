# frozen_string_literal: true

require './human'
# The class that is responsible for the mentor's actions
class Mentor < Human
  attr_reader :notifications
  attr_accessor :students

  def initialize(name:, surname:)
    super
    @students = []
    @notifications = []
  end

  def subscribe_to(student)
    student.mentors << self
    @students << student
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
