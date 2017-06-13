# Asks for input strings one by one until the user presses enter,
# then sort and print them (in a cool fashion)
# Note: all characters are accepted. Strings are sorted according to unicode.

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
  strings.push str

  if str.length > maxLength
    maxLength = str.length
  end

end

strings = strings.sort

puts 'After sorting, the strings are:'
strings.each_with_index do |str, i|
  # center strings, add spaces on left to add shifting effect
  puts ' ' * i * 2 + str.center(maxLength)
end
