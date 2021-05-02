# frozen_string_literal: true

require './human'
require './mentor'
require './homework'
require './notification'

# This class is responsible for the student's actions
class Student < Human
  attr_reader :homeworks, :notifications
  attr_accessor :mentors

  def initialize(name:, surname:)
    super
    @homeworks = []
    @mentors = []
    @notifications = []
  end

  def all_homeworks
    @homeworks.each { |homework| p homework }
  end

  def to_work(title, data)
    @homework = Homework.new(title: title, data: data)
  end

  def add_answer
    @homeworks << @homework
  end

  def to_check
    notification = Notification.new(message: "#{@homework.title} is done!")
    @mentors.each do |mentor|
      mentor.notifications << notification
    end
  end
end
