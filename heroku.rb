# https://devcenter.heroku.com/articles/dyno-sleeping


max_min = 24 * 60
downtime = 26

count = 0
sleep = false

min_count = 0

i = 0
until i == max_min
  if sleep == false
    if count < 30
      min_count += 1
      count += 1
      i += 1
    else
      sleep = true
      count = 0
    end

  else
    if count < downtime
      count += 1
      i += 1
    else
      sleep = false
      count = 0
    end
  end
end

fudge_factor = 960 - min_count - downtime
puts fudge_factor, fudge_factor / downtime.to_f

# 16 min downtime == perfect (too perfect)
# 17 min downtime ==  13 min fudge factor (0.765)
# 18 min downtime ==  42 min fudge factor (2.333)*
# 19 min downtime ==  52 min fudge factor (2.737)
# 20 min downtime ==  70 min fudge factor (3.5)*
# 21 min downtime ==  87 min fudge factor (4.143)
# 22 min downtime ==  98 min fudge factor (4.455)
# 23 min downtime == 118 min fudge factor (5.130)*
# 24 min downtime == 126 min fudge factor (5.25)
# 25 min downtime == 145 min fudge factor (5.8)*
# 26 min downtime == 154 min fudge factor (5.923)
