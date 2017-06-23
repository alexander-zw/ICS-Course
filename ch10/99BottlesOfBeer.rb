# Prints out the lyrics of "X Bottles of Beer on the Wall"
# (asks for the value of X)
# Uses English word form of the numbers ('ninety-nine' instead of '99')

# returns English form of number
def englishNumberOf number

  if number == 0
    return 'zero'
  end

  # database (database for thousands numbers is in helper method)
  onesPlaces = ['one',       'two',       'three',     'four',      'five',
                'six',       'seven',     'eight',     'nine']
  tensPlaces = ['ten',       'twenty',    'thirty',    'forty',     'fifty',
                'sixty',     'seventy',   'eighty',    'ninety']
  teenagers  = ['eleven',    'twelve',    'thirteen',  'fourteen',  'fifteen',
                'sixteen',   'seventeen', 'eighteen',  'nineteen']

  # englishNum is the string we will return.
  if number < 0
    englishNum = 'negative '
    # make number positive so that when converted to sting,
    # all characters are digits
    number = -number
  else
    englishNum = ''
  end

  strNum = number.to_s # convert to string for easy access of digits
  length = strNum.length # save length so we don't have to find it every time

  # write from largest to smallest digit (left to right)
  i = 0 # we will work on the ith digit (counting from zero)
  while i < length

    digit = strNum[i].to_i

    case (i - length) % 3 # used to sort between ones, tens, and hundreds

    when 2 # ones digit don't ask me why
      if digit > 0 # only do anything if there is a ones digit
        # The "- 1" is because onesPlaces[3] is 'four', not 'three'.
        englishNum += onesPlaces[digit - 1]
      end

      # only add thousands number if at least one of the last three digits
      # wasn't 0 (don't need to worry about nil)
      # and this is not the last digit
      if (digit > 0 || strNum[i - 1] != '0' || strNum[i - 2] != '0') &&
         i != length - 1
        englishNum += ' ' + thousandsWordOf(length - i - 1) + ' '
      end

    when 1 # tens digit don't ask me why
      if digit > 0 # only do anything if there is a tens digit
        #  Since we can't write "tenty-two" instead of "twelve",
        # we have to make a special exception for these.
        if ((digit == 1) && (strNum[i + 1] != '0')) # next digit not 0
          # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.
          englishNum += teenagers[strNum[i + 1].to_i - 1]
          # Since we took care of the digit in the ones place already,
          # we have nothing left to write in the next digit
          strNum[i + 1] = '0'
        else
          #  The "-1" is because tensPlaces[3] is 'forty', not 'thirty'.
          englishNum += tensPlaces[digit - 1]
        end
        if strNum[i + 1] != '0' # So we don't write 'sixtyfour'...
          englishNum += '-'
        end
      end

    when 0 # hundreds digit don't ask me why
      if digit > 0
        # The "- 1" is because onesPlaces[3] is 'four', not 'three'.
        englishNum += onesPlaces[digit - 1] + ' hundred'
        # So we don't write 'two hundredfifty-one' or 'two hundredone'...
        if strNum[i + 1] != '0' || strNum[i + 2] != '0'
          englishNum += ' '
        end
      end

    else
      puts 'Error: i % 3 out of range'
    end # end case statement

    i += 1
  end # end while loop

  return englishNum
end

# helper method: returns thousands number
def thousandsWordOf numZeros
  # this number is useful in determining the thousand-word
	numThousands = numZeros / 3 - 1;

  # overwhelmed, right? This is nothing, wait till you see latinRoots
	case (numThousands)
	when 0
  	return 'thousand';
	when 1
		return 'million';
	when 2
		return 'billion';
	when 3
		return 'trillion';
	when 4
		return 'quadrillion';
	when 5
		return 'quintillion';
	when 6
		return 'sextillion';
	when 7
		return 'septillion';
	when 8
		return 'octillion';
	when 9
		return 'nonillion';

	when 10
		return 'decillion';
	when 20
		return 'vigintillion';
	when 30
		return 'trigintillion';
	when 40
		return 'qradragintillion';
	when 50
		return 'quinquagintillion';
	when 60
		return 'sexagintillion';
	when 70
		return 'septagintillion';
	when 80
		return 'octogintillion';
	when 90
		return 'nonagintillion';
	when 100
		return 'centillion';

	else # if the number of zeros is not a tens or less than ten
    latinRoots = ['un',       'duo',      'tre',      'quattuor', 'quin',
                  'sex',      'septen',   'octo',     'novem']
		if numThousands > 10 # in case numThousands is -1 or smaller
			# the first part is the ones place, the second the tens place
			# the second part needs to be converted back to numZeros instead of
			# numThousands
      # the "- 1" is because latinRoots[5] is 'sex', not 'quin'
			return latinRoots[numThousands % 10 - 1] +
             thousandsWordOf(numThousands / 10 * 30 + 3);
      # note: if numThousands >= 110 (numZeros > 333) this will be stuck in
      # infinite recursion
		end

		return ''; # if none apply
	end
end

# obtains a number until it is valid and returns it
def getNum

  while true
    strNum = gets.chomp

    # check if the input was valid (a nonnegative int)
    if strNum[/[0-9]+/] == strNum
      num = strNum.to_i
      return num
    end
    puts 'I\'m sorry, it has to be an nonnegative integer. ' +
         'Maybe you can tell me again:'
  end

end

# prints the line of lyrics that goes 'numBottles bottles of beer'
# includes ' on the wall' when includeOnWall == true
# punctuation is added to the end
# the line is centered with lineLength characters in line
def printBottlesLine numBottles, includeOnWall, punctuation, lineLength
  # print number of bottles except when i is 0, then print 'No more'
  # use 'bottles' except when i is 1, then use 'bottle'
  puts (((numBottles == 0)? 'No more' : englishNumberOf(numBottles).capitalize) +
       ' bottle' + ((numBottles == 1)? '' : 's') + ' of beer' +
       ((includeOnWall)? ' on the wall' : '') + punctuation).center(lineLength)
end

# main program
puts 'How many bottles would you like on the wall?'
maxI = getNum
puts 'As you wish:'
puts

# number of characters in one line (including spaces)
lineLength = 70

# title (aligned center)
puts (englishNumberOf(maxI).capitalize + ' Bottle' +
     ((maxI == 1)? '' : 's') + ' of Beer on the Wall').center(lineLength)
puts

i = maxI
# Execute once, then keep executing until i gets to 0 and is reassigned 99
# then exit loop
begin
  printBottlesLine(i, true, ',', lineLength)
  printBottlesLine(i, false, '', lineLength)
  if i == 0
    puts ('Go to the store and buy some more,').center(lineLength)
    i = maxI
  else
    # use 'one' except when i is 1, then use 'it'
    puts ('Take ' + ((i == 1)? 'it' : 'one') +
         ' down, pass it around,').center(lineLength)
    i -= 1
  end
  printBottlesLine(i, true, '.', lineLength)
  puts
end until i == maxI
