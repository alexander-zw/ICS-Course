# Ask for favorite number, then suggest one added to the number
# as a bigger, better favorite number

puts 'Hey, old sport. What\'s your favorite number?'

while true
  strFavoriteNum = gets.chomp

  # Check if it's an integer
  if strFavoriteNum[/[0-9]+/] == strFavoriteNum
    break
  else
    puts 'I\'m sorry, it has to be a positive integer. Maybe you can tell me again:'
  end

end

puts 'Well, I have an idea. Isn\'t ' + (strFavoriteNum.to_i + 1).to_s + ' a bigger, better favorite number?'
