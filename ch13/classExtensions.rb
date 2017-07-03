# Adds some extensions the the Array and Integer classes

class Array

  # wrapper method that shuffles this array
  def shuffle
    recursiveShuffle([])
  end

  private
  # recursive helper method that shuffles self into shuffled then copies
  # shuffled into self
  def recursiveShuffle shuffled

    # check for termination condition
    if self.empty?
      self.push(shuffled)
      return
    end

    # randomly select a word in unshuffled and move to shuffled
    shuffled.push(self.delete_at(rand(self.length)))

    # shuffle the rest
    return recursiveShuffle(shuffled)
  end

end

class Integer

  # returns the factorial of this integer or nil if the factorial doesn't exist
  def factorial
    if self < 0
      return nil
    end
    i = 1
    fact = 1
    self.times do
      fact *= i
      i += 1
    end
    return fact
  end

  # converts this integer from 1 to 3999 into old-school Roman numeral
  # if this integer is out of range, return nil
  def toRoman

    # if the parameter out of range
    if self > 3999 || self == 0
      return nil
    end

    strNum = self.to_s
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
        numeral += getOneLetter(numDigits - i) * digit # add one-letter
      end

      i += 1
    end

    return numeral
  end

  private
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

end

arr = [1, 2, 3, 4, 5, 6]
arr.shuffle
puts "[1, 2, 3, 4, 5, 6] shuffled is #{arr.join(', ')}"
puts
puts "5.factorial is #{5.factorial}"
puts "-5.factorial is #{-5.factorial}"
puts
puts "2849.toRoman is #{2849.toRoman}"
puts "4000.toRoman is #{4000.toRoman}"
