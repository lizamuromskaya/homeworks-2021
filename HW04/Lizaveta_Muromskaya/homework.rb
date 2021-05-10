# frozen_string_literal: true

# class homework
class Homework
  attr_reader :title, :data
  attr_accessor :answer

  def initialize(title:, data:, student:, answer: nil)
    @title = title
    @data = data
    @student = student
    @answer = answer
  end
end
