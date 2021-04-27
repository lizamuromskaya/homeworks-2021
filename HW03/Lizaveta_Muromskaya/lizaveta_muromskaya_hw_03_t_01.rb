def task_1(log)
  arr = log.split("\n")
  count = arr.length - 1
  arr.each_with_index do |i, c|
    if i['error']
      p i
      break
    elsif c == count && !i['error']
      p "\n"
      break
    end
  end
end
