# frozen_string_literal: true

# class homework
class Homework
  attr_reader :title, :data

  def initialize(title:, data:)
    @title = title
    @data = data
  end
end
