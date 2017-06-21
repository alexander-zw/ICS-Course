=begin
Asks for input strings, sorts them with insertion sort, selection sort, or
bubble sort depending on user's choice, and outputs them
(All methods are iterative)
Note: All characters are accepted. Strings are sorted according to unicode.
=end

# --------------------------- METHODS OF SORTING ---------------------------

def selectionSort arr

  length = arr.length
  i = 0
  while i < length

    # find minimum index from i to length - 1
    minInd = i
    j = i + 1
    while j < length
      if arr[j] < arr[minInd]
        minInd = j
      end
      j += 1
    end
    # swap minimum word so it is added to the sorted portion
    min = arr[minInd]
    arr[minInd] = arr[i]
    arr[i] = min
    i += 1

  end

  return arr
end

def insertionSort arr

  length = arr.length
  i = 1 # start with second word since first word is already sorted
  while i < length

    # find index where ith word belongs
    j = 0
    while j < i
      if arr[j] > arr[i]
        break
      end
      j += 1
    end
    # insert ith word at the correct index in the sorted portion
    arr.insert(j, arr.delete_at(i))
    i += 1

  end

  return arr
end

def bubbleSort arr

  length = arr.length
  swapOccurred = true # make true so loop will be entered
  # at the beginning, compare from indices 0 and 1 to indices -2 and -1
  i = length - 1
  # in the end, compare indices 0 and 1 only
  while swapOccurred && i > 0

    swapOccurred = false
    # compare and swap from indices 0 and 1 to indices (i - 1) and i
    j = 0
    while j < i
      if arr[j] > arr[j + 1]
        smaller = arr[j + 1]
        arr[j + 1] = arr[j]
        arr[j] = smaller
        swapOccurred = true
      end
      j += 1
    end
    i -= 1

  end

  return arr
end

# --------------------------- USER INTERFACE ---------------------------

# displays a list of strings in a fancy fashion
def printStrings strArr, maxLength
  strArr.each_with_index do |str, i|
    # center strings, add spaces on left to add shifting effect
    puts ' ' * i * 2 + str.center(maxLength)
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

# ask which sorting method user wants to use
def askForSort

  choices = ["Selection Sort", "Insertion Sort", "Bubble Sort"]
  puts 'How would you like the strings to be sorted?'
  puts "1: #{choices[0]}\n2: #{choices[1]}\n3: #{choices[2]}"
  
  while true
    reply = gets.chomp.to_i
    case reply
    when 1..3
      puts "Okay, you have chosen #{choices[reply - 1]}"
      return reply
    else # don't break from loop
      puts 'Huh? Please type a number from 1 to 3:'
    end
  end

end

# --------------------------- COMPLETE PROCEDURE ---------------------------

# obtain string array, whether it is predetermined or user-chosen
if askForExample
  stringsAndMaxLen = showExampleArr
else
  stringsAndMaxLen = getStrings
end

# sort the array using chosen method
case askForSort
when 1
  strings = selectionSort(stringsAndMaxLen[0])
when 2
  strings = insertionSort(stringsAndMaxLen[0])
when 3
  strings = bubbleSort(stringsAndMaxLen[0])
else
  puts 'Error: askForSort out of range'
end

# print the array
puts 'After sorting, the strings are:'
printStrings(strings, stringsAndMaxLen[1])
