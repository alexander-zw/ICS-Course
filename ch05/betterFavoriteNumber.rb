# Ask for favorite number, then suggest one added to the number
# as a bigger, better favorite number

# obtain the number until it is valid
def getNum

  while true
    # modify the input so that to_i or to_f always makes a number identical to the string
    strFavoriteNum = cleanZeros(gets.chomp)

    # Check if it's a float or integer and create favoriteNum accordingly
    if strFavoriteNum.to_i == strFavoriteNum.to_f
      favoriteNum = strFavoriteNum.to_i
    else
      favoriteNum = strFavoriteNum.to_f
    end

    # check if the input was valid (either an int or float)
    if favoriteNum.to_s == strFavoriteNum
      return favoriteNum
    else
      puts 'I\'m sorry, it has to be an integer or decimal. Maybe you can tell me again:'
    end

  end

end

# basically make the number look cleaner with respect to zeros, assuming it's a number
#
# removes leading zeros until only one char is left (may or may not be a zero)
#
# removes tailing zeros and then the tailing decimal point, if there is a decimal point
#
# add a zero if necessary (for example, '.3' becomes '0.3' and '.0' becomes '0')
# do not add zero if strNum is '.'
#
# when the first char is '-', ignore this char, then trim
# except when the number is zero. When it's basically zero,
# there's no need to add '-'
#
# yes I know, this is so messed up
def cleanZeros strNum

  # remove '-' if it is the first char
  if strNum[0] == '-'
    isNegative = true
    strNum = strNum[1..-1]
  else
    isNegative = false
  end

  if strNum[0] == '.'
    # if strNum is '.' or '-.', exit method
    if strNum == '.'
      return ((isNegative)? '-' : '') + '.'
    end
    # if strNum begins with '.', add leading zero
    strNum = '0' + strNum
  end

  if strNum.include? '.'
    # remove tailing zeros
    while strNum[-1] == '0'
      strNum = strNum[0..-2]
    end

    # remove tailing decimal point
    if strNum[-1] == '.'
      strNum = strNum[0..-2]
    end
  end

  # remove leading zeros until one char is left or next char is decimal point
  while strNum[0] == '0' && strNum[1] != '.' && strNum.length != 1
    strNum = strNum[1..-1]
  end

  # restore the leading '-' unless the number is zero
  if isNegative && strNum != '0'
    strNum = '-' + strNum
  end

  return strNum

end

puts 'Hey, old sport. What\'s your favorite number?'

# ask for favorite number and suggest better one
puts 'Well, I have an idea. Isn\'t ' + (getNum + 1).to_s + ' a bigger, better favorite number?'
