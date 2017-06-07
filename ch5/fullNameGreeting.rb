# Ask for a person's first, middle, and last names one by one,
# then greet them with their whole name

puts 'Hey there. What\'s your first name?'

# Check if the name consists of only letters, is capitalized, and is not empty
invalidName = true
while invalidName
  wholeName = gets.chomp

  if wholeName[/[A-Za-z]+/] != wholeName || wholeName.capitalize != wholeName

    puts 'Are you sure that\'s your name?'
    while true
      reply = gets.chomp

      if reply.downcase == 'yes'
        puts 'Okay, if you\'re sure.'
        invalidName = false
        break # break from both loops

      elsif reply.downcase == 'no'
        puts 'Then you\'d better tell me again.'
        break # break only from inner loop

      else # don't break from either loop
        puts 'Huh? Please type "yes" or "no":'

      end

    end

  else
    break # Name passes test
  end
end

puts 'What about your middle name? (If you don\'t have one, just press enter.)'

# Check if the name consists of only letters and is capitalized
invalidName = true
while invalidName
  middleName = gets.chomp

  if (middleName[/[A-Za-z]+/] != middleName || middleName.capitalize != middleName) && middleName != ''

    puts 'Are you sure that\'s your name?'
    while true
      reply = gets.chomp

      if reply.downcase == 'yes'
        puts 'Okay, if you\'re sure.'
        invalidName = false
        break # break from both loops

      elsif reply.downcase == 'no'
        puts 'Then you\'d better tell me again.'
        break # break only from inner loop

      else # don't break from either loop
        puts 'Huh? Please type "yes" or "no":'

      end

    end

  else
    break # Name passes test
  end
end

# Add a space if there is a middle name and a first name
if middleName != '' && wholeName != ''
  wholeName += ' ' + middleName
else
  wholeName += middleName
end

puts 'And if you don\'t mind, your last name?'

# Check if the name consists of only letters, is capitalized, and is not empty
invalidName = true
while invalidName
  lastName = gets.chomp

  if lastName[/[A-Za-z]+/] != lastName || lastName.capitalize != lastName

    puts 'Are you sure that\'s your name?'
    while true
      reply = gets.chomp

      if reply.downcase == 'yes'
        puts 'Okay, if you\'re sure.'
        invalidName = false
        break # break from both loops

      elsif reply.downcase == 'no'
        puts 'Then you\'d better tell me again.'
        break # break only from inner loop

      else # don't break from either loop
        puts 'Huh? Please type "yes" or "no":'

      end

    end

  else
    break # Name passes test
  end
end

# Add a space if there is a last name and there is a middle or first name
if lastName != '' && wholeName != ''
  wholeName += ' ' + lastName
else
  wholeName += lastName
end

puts 'Okay, nice to meet you, ' + wholeName + '.'
