# Contains a method that returns the old-school Roman numeral version of an integer
# Program asks for input and outputs the Roman numeral

# converts an integer in string form from 1 to 3999 into old-school Roman numeral
# if numeral is invalid, return nil
def romanOf strNum

  intNum = strNum.to_i
  # if the parameter is not an int, empty, or out of range
  if strNum[/[0-9]+/] != strNum || intNum > 3999 || intNum == 0
    return nil
  end

  # make strNum neater (trim leading zeros) so as not to confuse digit places
  strNum = intNum.to_s
  # the unfinished Roman numeral
  numeral = ''
  numDigits = strNum.length

  i = 0
  while i < numDigits

    # the (numDigits - i)th digit from the right
    digit = strNum[i].to_i

    if digit == 9
      numeral += getOneLetter(numDigits - i) + getOneLetter(numDigits - i + 1)
    elsif digit == 4
      numeral += getOneLetter(numDigits - i) + getFiveLetter(numDigits - i)
    else
      if digit >= 5 # add five-letter
        numeral += getFiveLetter(numDigits - i)
        digit -= 5
      end

      if digit == 4
        numeral += getOneLetter(numDigits - i)
      else
        numeral += getOneLetter(numDigits - i) * digit # add one-letter
      end
    end

    i += 1

  end

  return numeral

end

# gives the correct letter representing a five from the digit place
def getFiveLetter digit
  case digit
  when 1
    return 'V'
  when 2
    return 'L'
  when 3
    return 'D'
  else
    puts "\nError: invald digit place"
    return nil
  end
end

# gives the correct letter representing a one from the digit place
def getOneLetter digit
  case digit
  when 1
    return 'I'
  when 2
    return 'X'
  when 3
    return 'C'
  when 4
    return 'M'
  else
    puts "\nError: invald digit place"
    return nil
  end
end

# obtains an integer and keeps asking for it until it is valid
# returns an array containing the number as a string and the Roman numeral
def getNums

  # check if the number, after converting to Roman numeral, is not nil
  while true

    strNum = gets.chomp
    romanNum = romanOf(strNum)
    if romanNum == nil
      puts 'Um... I\'m sorry, I can\'t convert that. Maybe try something else?'
    else
      # make strNum neater (trim leading zeros)
      return [strNum.to_i.to_s, romanNum]
    end

  end

end


puts 'What\'s the number?'
nums = getNums
puts 'The modern Roman numeral of ' + nums[0] + ' is ' + nums[1] + '.'
