=begin
Shuffles an array of strings input by the user
or a number array (stored as strings) of length specified by user
and prints the outcome
method of print is decided by user (fancy or simpler)
Shuffle uses recursion
Note: All characters are accepted. Strings are shuffled according to unicode.
=end

# --------------------------- METHOD OF SHUFFLE ---------------------------

# wrapper method that shuffles arr
def shuffle arr
  return recursiveShuffle(arr, [])
end

# recursive helper method that shuffles arr
def recursiveShuffle unshuffled, shuffled

  # check for termination condition
  if unshuffled.empty?
    return shuffled
  end

  # randomly select a word in unshuffled and move to shuffled
  randIndex = rand(unshuffled.length)
  shuffled.push(unshuffled.delete_at(randIndex))

  # shuffle the rest
  return recursiveShuffle(unshuffled, shuffled)
end

# --------------------------- USER INTERFACE ---------------------------

# displays a list of strings in a fancy fashion
def printStrings strArr, maxLength
  strArr.each_with_index do |str, i|
    # center strings, add spaces on left to add shifting effect
    puts ' ' * i * 2 + str.center(maxLength)
  end
end

# displays a list of strings in a "boring" fashion to save space
def boringPrintStrings strArr
  puts strArr.join('∙')
end

# ask whether user wants to use a list of numbers and return boolean
def askForNumbers
  # don't display anything if answer is "yes"
  askSomething('Would you like to use an auto-generated list of numbers?',
               '', "Then you may tell me what you want to shuffle\n")
end

# asks which numbers the user wants to use and returns an array
# containing the number array and its maximum string length
def getNumbers

  print 'I will use a list containing numbers from 1 to n. '
  puts 'Please tell me what you would like n to be'

  while true

    strMaxNum = gets.chomp
    maxNum = strMaxNum.to_i

    # check if the input was valid (positive integer)
    if strMaxNum[/[0-9]+/] == strMaxNum && maxNum != 0
      if maxNum > 8000
        puts 'That\'s... a little too big. Try something else'
        next
      end
      return createNumberArray(maxNum)
    else
      print 'I\'m sorry, it has to be a positive integer. '
      puts 'Maybe you can tell me again:'
    end

  end

  return [strings, maxLength]
end

# create an array of numbers stored as strings from 1 to maxNum
# and return an array containing it and its maximum string length
def createNumberArray maxNum
  arr = []
  i = 1
  maxNum.times do
    arr << i.to_s
    i += 1
  end
  return [arr, maxNum.to_s.length]
end

# asks for strings and returns an array containing the string array
# and the maximum string length
def getStrings

  strings = []
  puts 'Please input the strings one by one and press enter to exit:'

  # keep track of maximum length of strings
  maxLength = 0

  # obtain strings
  while true

    str = gets.chomp
    if str == ''
      break
    end
    strings.push(str)

    if str.length > maxLength
      maxLength = str.length
    end

  end

  return [strings, maxLength]

end

# asks whether the user would like to use simpler format
# of printing strings
def askForBoringPrint
  # do not print any message after reply
  askSomething('Would you like to use a more boring printing method? Though it is more boring, it also saves space and is recommended if your list is too long. Otherwise the output will look kinda wierd',
               '', '')
end

# ask whether user wants to something and return boolean
# prompt is displayed first, yesMessage and noMessage after reply
# yesMessage and noMessage must include newline characters at end
# to not display any message, use yesMessage or noMessage == ''
# this is a template for other methods
def askSomething prompt, yesMessage, noMessage

  puts prompt
  while true
    reply = gets.chomp

    if reply.downcase == 'yes'
      print yesMessage
      return true

    elsif reply.downcase == 'no'
      print noMessage
      return false

    else # don't break from loop
      puts 'Huh? Please type "yes" or "no":'

    end
  end

end

# --------------------------- COMPLETE PROCEDURE ---------------------------

# obtain string array, whether it is a number array or user-chosen strings
if askForNumbers
  stringsAndLen = getNumbers
else
  stringsAndLen = getStrings
end

# shuffle the array
strings = shuffle(stringsAndLen[0])

# ask which method of print to use
useBoringPrint = askForBoringPrint

# print the array according to method
puts 'Okay. After shuffling, the strings are:'
if useBoringPrint
  boringPrintStrings(strings)
  puts 'Yeah, it\'s not that boring, is it?'
else
  printStrings(strings, stringsAndLen[1])
end
