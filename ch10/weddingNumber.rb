# Asks for user to input a number, converts it to English word form
# with many 'and's between (thus 'wedding number'), and outputs
# a wedding invitation containing the English number

# returns English form of number with many 'and's added between
def weddingNumberOf number

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
        # 90% of the time: one thousand and six hundreds
        # 10% of the time: one thousand six hundred
        englishNum += 'and ' if rand < 0.9
      end

    when 1 # tens digit don't ask me why
      if digit > 0 # only do anything if there is a tens digit
        # only write either 'eighteen' (20% of the time)
        # or 'ten and eight', not 'ten-eight'
        if rand < 0.2 && digit == 1 && strNum[i + 1] != '0' # next digit not 0
            # the "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.
            englishNum += teenagers[strNum[i + 1].to_i - 1]
            # since we took care of the digit in the ones place already,
            # we have nothing left to write in the next digit
            strNum[i + 1] = '0'
        else
          #  the "-1" is because tensPlaces[3] is 'forty', not 'thirty'.
          englishNum += tensPlaces[digit - 1]
        end
        if strNum[i + 1] != '0' # so we don't write 'sixtyfour'...
          # 90% of the time or when already wrote 'ten'
          if rand < 0.9 || digit == 1
            englishNum += ' and ' # sixty and four
          else
            englishNum += '-' # sixty-four
          end
        end
      end

    when 0 # hundreds digit don't ask me why
      if digit > 0
        # The "- 1" is because onesPlaces[3] is 'four', not 'three'.
        englishNum += onesPlaces[digit - 1] + ' hundred'
        # So we don't write 'two hundredfifty-one' or 'two hundredone'...
        if strNum[i + 1] != '0' || strNum[i + 2] != '0'
          englishNum += ' '
          # 90% of the time: 'two hundred and forty'
          # 10% of the time: 'two hundred forty'
          englishNum += 'and ' if rand < 0.9
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

# obtains the number until it is valid and returns it
def getYear

  while true
    strYear = gets.chomp

    # check if the input was valid (an positive or negative int)
    if strYear[/[0-9]+/] == strYear ||
       (strYear[0] == '-' && strYear[1..-1][/[0-9]+/] == strYear[1..-1])
      year = strYear.to_i
      # only if there are 333 digits or fewer
      if year.abs.to_s.length <= 333
        if year <= 0 || year > 1000000 # wierd year
          puts 'Well, it\'s none of my business if no one can understand ' +
               'what year you\'re referring to'
        end
        return year
      else # number too big
        puts 'That\'s... a little too big. Can\'t you try something smaller?'
      end
    else
      puts 'Don\'t be ridiculous, what year is it really?'
    end
  end

end

# prints wedding invitation according to the year given as int
def printInvitation year
  lines = ['TOGETHER WITH THEIR FAMILIES',
           '',
           'Hermione Jean Granger',
           '&',
           'Ronald Bilius Weasley',
           '',
           "INVITE YOU TO SHARE THE JOY",
           'OF THE BEGINNING OF THEIR NEW LIFE TOGETHER',
           'WHEN THEY EXCHANGE MARRIAGE VOWS',
           'ON SUNDAY, THE NINETEENTH OF SEPTEMBER',
           weddingNumberOf(year).upcase,
           'AT FIVE O\'CLOCK IN THE AFTERNOON',
           'ST ALOYSIUS CHURCH | LONDON',
           '',
           'RECEPTION TO FOLLOW']

  lineLength = lines[7].length + 30
  puts
  lines.each do |line|
    puts line.center(lineLength)
  end
end

puts 'Hi, I am your wedding coordinator. Please tell me what year it is'
year = getYear

puts "Okay, here is how your wedding invitation should look:"
printInvitation(year)
