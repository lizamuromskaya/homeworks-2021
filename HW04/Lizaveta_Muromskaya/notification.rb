# frozen_string_literal: true

# class notification
class Notification
  private

  attr_reader :message

  public

  def initialize(message:)
    @message = message
  end
end
