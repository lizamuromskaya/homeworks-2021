# frozen_string_literal: true

# class notification
class Notification
  attr_reader :message

  def initialize(message:)
    @message = message
  end
end