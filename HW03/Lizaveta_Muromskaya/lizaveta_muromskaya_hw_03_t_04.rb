def task_4(str)
  hh = {}
  hh[:letters] = str.count('A-Za-z')
  hh[:digits] = str.count('0-9')
  p hh
end
