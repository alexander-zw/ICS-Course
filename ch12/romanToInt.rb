# Asks for a Roman numeral, converts it to an integer, then outputs the result

# returns the number the Roman numeral represents (modern Roman numeral)
# or nil if numeral is invalid or out of range (1..3999)
def romanToInt numeral
  return nil if numeral == '' # invalid numeral
  num = 0
  i = numeral.length - 1
  while true

    j = i
    # consecutive identical letters such as 'iii'
    while numeral[i] == numeral[j] && i >= 0
      # cannot be more than 3 consecutive identical letters
      return nil if i <= j - 3

      corrNum = correspondingNum(numeral[i])
      # cannot be more than 1 consecutive identical five-letter
      return nil if corrNum.to_s[0] == '5' && i <= j - 1

      if corrNum == nil
        return nil # invalid Roman numeral
      else
        num += corrNum
      end

      i -= 1
    end

    if i < 0
      return num # all letters converted
    end

    corrNum = correspondingNum(numeral[i])
    if corrNum == nil
      return nil # invalid Roman numeral
    else
      # if there's only one consecutive identical letter (such as 'x' instead
      # of 'xx') and the letter to the left represents a one-level smaller
      # number than the one on the right (such as 'iv' or 'xc')
      if i == j - 1 && compareLetters(numeral[i], numeral[j])
        num -= corrNum
        i -= 1
      end

      # next letter (if there is one) is smaller than current one
      # next letter may have changed at the previous i -= 1
      if i >= 0 && correspondingNum(numeral[i]) < correspondingNum(numeral[j])
        return nil # invalid Roman numeral
      end
    end

  end
end

# returns the number the letter corresponds to
# returns nil for incorrect characters
def correspondingNum letter
  case letter.downcase
  when 'i'
    return 1
  when 'v'
    return 5
  when 'x'
    return 10
  when 'l'
    return 50
  when 'c'
    return 100
  when 'd'
    return 500
  when 'm'
    return 1000
  else
    return nil
  end
end

# returns true when letter1 is one level lower than letter2
# and letter1 is a one-letter (instead of five-letter)
# compareLetters('x', 'd') == true, compareLetters('i', 'x') == true,
# compareLetters('i', 'c') == false, compareLetters('v', 'x') == false
def compareLetters letter1, letter2
  num1 = correspondingNum(letter1)
  num2 = correspondingNum(letter2)
  return false if num1.to_s[0] != '1' || num2 == nil
  return num2 == num1 * 5 || num2 == num1 * 10
end

puts 'Please give me a Roman numeral'
begin
  number = romanToInt(gets.chomp)
  if number != nil
    puts "Hmm... That was #{number}, I believe"
    break
  end
  puts "Well, that number was... Umm... Er..."
  puts "Hey, why don't you give me another one?"
end while true
