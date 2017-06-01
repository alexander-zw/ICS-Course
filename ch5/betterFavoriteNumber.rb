# Ask for favorite number, then suggest one added to the number
# as a bigger, better favorite number

puts 'Hey, old sport. What\'s your favorite number?'
favoriteNum = gets.to_i
puts 'Well, I have a idea. Isn\'t ' + (favoriteNum + 1).to_s + ' a bigger, better favorite number?'
