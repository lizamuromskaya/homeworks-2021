def task_3(log)
  @arr = []
  @result = []
  # Calling core with action:
  a = log.split("\n")
  a.each_with_index do |string, _index|
    if string['Calling core with action:']
      time = string.scan(/[0-9]+:[0-9]+:[0-9]+\.[0-9]/) # time
    end
    next if time.nil?

    time.each do |i|
      d = i.split(':')
      sec = d[0].to_f * 3600 + d[1].to_f * 60 + d[2].to_f
      @arr << sec
    end
    (0..@arr.size - 2).each do |i|
      res = @arr[i + 1] - @arr[i]
      @result << res.round(1).to_s if res > 0
    end
  end
  @result.size>0 ?  "#{p @result}" : "#{p "0"}"
end
