# frozen_string_literal: true

def task1(log)
  lines = log.split("\n")
  lines.each { |line| return p line if line.include?('error') }
  p ''
end
