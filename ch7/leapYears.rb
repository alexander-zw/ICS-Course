# Asks for a starting year and ending year and outputs the leap years between (inclusive)

puts 'Please tell me a starting year'

invalidYear = true
# receive input and verify
while invalidYear
  strStartYear = gets.chomp
  startYear = strStartYear.to_i
  if startYear == 0 # year is 0 or doesn't begin with a digit
    print 'I\'m sorry, I can\'t use that as my starting year'
  elsif startYear < 0
    print 'Hmm... Do you mean BCE? I can\'t find leap years before the common era'
  elsif startYear.to_s != strStartYear
    puts 'Do you mean the year ' + startYear.to_s + '?'

    while true
      reply = gets.chomp

      if reply.downcase == 'yes'
        puts 'Okay, got it'
        invalidYear = false
        break # break from both loops

      elsif reply.downcase == 'no'
        print 'Well, I don\'t understand which year ' + strStartYear + ' is, so..'
        break # break only from inner loop

      else # don't break from either loop
        puts 'Huh? Please type "yes" or "no":'

      end

    end

  else
    break
  end

  if invalidYear
    puts '. Maybe try something else?'
  end

end

puts 'And the ending year?'

invalidYear = true
# receive input and verify
while invalidYear
  strEndYear = gets.chomp
  endYear = strEndYear.to_i
  if endYear == 0 || endYear < startYear
    print 'I\'m sorry, I can\'t use that as my starting year'
  elsif endYear < 0
    print 'Hmm... Do you mean BCE? I can\'t find leap years before the common era'
  elsif endYear.to_s != strEndYear
    puts 'Do you mean the year ' + endYear.to_s + '?'

    while true
      reply = gets.chomp

      if reply.downcase == 'yes'
        puts 'Okay, got it'
        invalidYear = false
        break # break from both loops

      elsif reply.downcase == 'no'
        print 'Well, I don\'t understand which year ' + strEndYear + ' is, so..'
        break # break only from inner loop

      else # don't break from either loop
        puts 'Huh? Please type "yes" or "no":'

      end

    end

  else
    break
  end

  if invalidYear
    puts '. Maybe try something else?'
  end

end

puts 'Okay, here\'s what I found:'

# increment startYear to the next integer divisible by 4
if startYear % 4 != 0
  startYear += 4 - startYear % 4
end

while startYear <= endYear
  if startYear % 100 != 0 || startYear % 400 == 0
    print startYear.to_s + ' '
  end
  startYear += 4
end
puts
