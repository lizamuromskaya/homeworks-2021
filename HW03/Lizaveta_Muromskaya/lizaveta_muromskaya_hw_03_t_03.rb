# frozen_string_literal: true

TIME = /[0-9]+:[0-9]+:[0-9]+\.[0-9]/.freeze
def time_in_sec(time, seconds)
  time.each do |time_numbers|
    time_buf = time_numbers.split(':')
    sec = time_buf[0].to_f * 3600 + time_buf[1].to_f * 60 + time_buf[2].to_f
    seconds << sec
  end
end

def time_difference(seconds)
  seconds.each_cons(2).map do |start_event, end_event|
    res = end_event - start_event
    res.positive? ? res.round(1).to_s : nil
  end.compact
end

def task3(log)
  seconds = []

  lines = log.split("\n")
  lines.each do |string|
    time = string.scan(TIME) if string.include?('Calling core with action:')
    next if time.nil?

    time_in_sec(time, seconds)
    time_difference(seconds)
  end
end
