def task_2(log)
  @arr = []
  str = ''
  data = log.scan(%r{[0-9]+/[A-z]+/[0-9]+:+[0-9]+:+[0-9]+:+[0-9]+\s+\+[0-9]*}) # data
  from = log.scan(/^[0-9]+\.+[0-9]+\.+[0-9]+\.+[0-9]*/) # from
  to = log.scan(%r{/[a-z]+/[0-9]+/[a-z]+}) # to
  to.each { |i| i.upcase! }
  (0..data.size - 1).each do |i|
    str = "DATA: #{data[i]} FROM: #{from[i]} TO: #{to[i]}"
    @arr << str
  end
  if @arr.size > 0
    @arr.each { |i| p i }
  else
    p @arr
  end
end
