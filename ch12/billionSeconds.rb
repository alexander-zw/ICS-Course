# asks for user's birthday, then tell them when they'll be a billion seconds
# old

# ask for birthday, return Time object of birthday
def getBirthday
  puts 'What year were you born?'
  year = getTime('year')
  puts 'And what month?'
  month = getTime('month')
  puts 'On which day?'
  day = getTime('day')
  puts 'And could you tell me the exact time of day? In hh:mm:ss format'
  time = getTimeOfDay
  return Time.gm(year, month, day, time[0], time[1], time[2])
end

# gets a time from the user (return time)
def getTime typeOfTime

  # receive input and verify
  while true
    strTime = gets.chomp
    time = verifyTypeOfTime(typeOfTime, strTime)

    if time != nil
      if time.to_s != strTime
        puts "Do you mean the #{typeOfTime} \"#{time}\"?"
        return time if verifyIntTime(typeOfTime, strTime)
      else
        return time
      end
    end

    puts '. Please, please enter the correct time.'
  end

end

# asks user if they mean time instead of strTime and return boolean
def verifyIntTime typeOfTime, strTime
  while true
    reply = gets.chomp

    if reply.downcase == 'yes'
      puts 'Okay, got it'
      return true
    end
    if reply.downcase == 'no'
      print "Well, I don\'t understand which #{typeOfTime} \"#{strTime}\" " +
            'is, so..'
      return false
    end
    puts 'Huh? Please type "yes" or "no":'

  end
end

# verify whether the time is valid according to the type of time
# return the integer time according to strTime if it is valid so far
# else return nil
def verifyTypeOfTime typeOfTime, strTime
  time = strTime.to_i

  case typeOfTime
  when 'year'
    if time < 0 # still a valid year, but clarify to user
      # add '. ' to end since we are not starting a new line
      print 'Hmm... Do you mean BCE? Don\'t tell me you\'re thousands of ' +
            'years old. Fine, I\'ll use that year anyway. '
    end

  when 'month'
    # if strTime doesn't start with a digit, the month may be written as
    # a string such as 'February'
    time = verifyStrMonth(strTime) if time == 0
    if time < 0 || time > 12
      print 'What kind of month is that? I certainly don\'t know'
      return nil
    end

  when 'day'
    # only verify this much because it would be soooo tedious to take care
    # of the different lengths of months and leap years
    if time < 0 || time > 31
      print 'That is not a good day to be born on'
      return nil
    end

  end

  # time is 0 or doesn't begin with a digit, which is invalid for any type
  # of time, unless it's a month (which has already been taken care of)
  if time == 0
    print "There's no such thing as the #{typeOfTime} \"#{strTime}\""
    return nil
  end

  return time
end

# verify if strMonth is a valid string month such as 'February'. Case of
# letters is ignored. Return month number or 0 if strMonth isn't valid
def verifyStrMonth strMonth
  monthArr = ['january',   'february',  'march',     'april',
              'may',       'june',      'july',      'august',
              'september', 'october',   'november',  'december']
  index = monthArr.index(strMonth.downcase)
  return index + 1 if index != nil
  return 0
end

# gets the time of day from user and returns an array containing the number
# of hours, minutes, seconds
def getTimeOfDay
  # receive input and verify
  while true
    validTime = true
    strTimes = gets.chomp
    times = strTimes.split(':')

    # if it is not three items separated by ':'
    if times.length != 3
      print 'That is not right'

    else
      times.each_with_index do |time, i|
        strTime = time
        time = time.to_i

        # if one of the times is not valid
        if strTime[/[0-9]+/] != strTime || time > 59 || (i == 0 && time > 23)
          print 'This is not a valid time'
          validTime = false
          break # break from each method
        end
      end

      return times if validTime
    end

    puts '. Please, please enter the correct time.'
  end
end

birthday = getBirthday
secondsOld = (Time.new - birthday).round
puts "You are #{(secondsOld < 0)? 'not born yet' : "#{secondsOld} seconds old"}. " +
     "You #{(secondsOld < 10**9)? 'will be' : 'were'} a billion seconds old at:"
puts (birthday + 10**9).to_s[0..-5]
puts 'Assuming you\'re in the same time zone'
