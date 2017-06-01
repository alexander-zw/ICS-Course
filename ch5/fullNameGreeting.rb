# Ask for a person's first, middle, and last names one by one,
# then greet them with their whole name

puts 'Hey there. What\'s your first name?'
wholeName = gets.chomp
puts 'What about your middle name? (If you don\'t have one, just press enter.)'
wholeName += ' ' + gets.chomp
puts 'And if you don\'t mind, your last name?'
wholeName += ' ' + gets.chomp

puts 'Okay, nice to meet you, ' + wholeName + '.'
