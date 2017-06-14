# Ask for a person's first, middle, and last names one by one,
# then greet them with their whole name

# obtains a name and keeps asking for it until it is valid
def getName allowEmpty

  # check if the name consists of only letters, is capitalized, and is not empty
  while true
    name = gets.chomp

    # if the name is valid or the user really wants to use this name
    # or if the name is empty and we allow it
    if (name[/[A-Za-z]+/] == name && name.capitalize == name) || (name == '' && allowEmpty) || verifyName
      return name # use the name
    end
  end

end

# verify whether user really wants to use this name and return true if so
def verifyName

  puts 'Are you sure that\'s your name?'
  while true
    reply = gets.chomp

    if reply.downcase == 'yes'
      puts 'Okay, if you\'re sure.'
      return true

    elsif reply.downcase == 'no'
      puts 'Then you\'d better tell me again.'
      return false

    else # don't break from loop
      puts 'Huh? Please type "yes" or "no":'

    end
  end

end

# Add a space if name so far (oldName) and name to add (newName) are both not empty
def joinNames oldName, newName
  return oldName + ((newName != '' && oldName != '')? ' ': '') + newName
end

puts 'Hey there. What\'s your first name?'

wholeName = getName(false)

puts 'What about your middle name? (If you don\'t have one, just press enter.)'

middleName = getName(true)

wholeName = joinNames(wholeName, middleName)

puts 'And if you don\'t mind, your last name?'

lastName = getName(false)

wholeName = joinNames(wholeName, lastName)

puts 'Okay, nice to meet you, ' + wholeName + '.'
