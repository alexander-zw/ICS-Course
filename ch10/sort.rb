# Asks for input strings (or uses example array if user wants to),
# sorts them with recursion, and outputs them
# Note: All characters are accepted. Strings are sorted according to unicode.

# --------------------------- METHOD OF SORTING ---------------------------

# wrapper method that sorts arr
def sort arr
  return recursiveSort(arr, [])
end

# recursive helper method that sorts arr
def recursiveSort unsorted, sorted

  # check for termination condition
  if unsorted.empty?
    return sorted
  end

  # find minimum index
  minI = 0
  unsorted.each_with_index do |word, i|
    if word < unsorted[minI]
      minI = i
    end
  end
  # put min word from unsorted to sorted
  sorted.push(unsorted.delete_at(minI))
  
  # sort the rest
  return recursiveSort(unsorted, sorted)
end

# --------------------------- USER INTERFACE ---------------------------

# displays a list of strings in a fancy fashion
def printStrings strArr, maxLength
  strArr.each_with_index do |str, i|
    # center strings, add spaces on left to add shifting effect
    puts ' ' * i * 2 + str.center(maxLength)
  end
end

# ask whether user wants to use predetermined list
def askForExample

  puts 'Would you like to use the example list of strings?'
  while true
    reply = gets.chomp

    if reply.downcase == 'yes'
      puts 'Okay, here is the list:'
      return true

    elsif reply.downcase == 'no'
      puts 'Then you may tell me what you want to sort.'
      return false

    else # don't break from loop
      puts 'Huh? Please type "yes" or "no":'

    end
  end

end

# prints the example array of strings and returns an array
# containing the example array and its maximum string length
def showExampleArr
  strings = ['Mike', 'x-ray', '1,000,000', 'NASCAR', '!', '你好', 'zebra',
             '"The Force is strong with this one."', 'éclairs', 'milk', '???',
             'a merry Christmas', 'Ruby', 'milky', 'ABC', 'NASCAR']
  maxLength = '"The Force is strong with this one."'.length
  printStrings(strings, maxLength)
  puts '(Please press enter)'
  gets
  return [strings, maxLength]
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

# --------------------------- COMPLETE PROCEDURE ---------------------------

# obtain string array, whether it is predetermined or user-chosen
if askForExample
  stringsAndLen = showExampleArr
else
  stringsAndLen = getStrings
end

# sort the array
strings = sort(stringsAndLen[0])

# print the array
puts 'After sorting, the strings are:'
printStrings(strings, stringsAndLen[1])
