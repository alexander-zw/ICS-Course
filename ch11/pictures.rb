# Finds .jpg photos under the folder '~/Documents/Fotos/ruby_photos'
# and renames them as "#{batchName} #{picNumber}.jpg"
# Asks user to confirm if any existing file is about to be overwritten

# verify whether user really wants to rename to this filename since
# another file will be overwritten, and return true if so
def verifyName i, filename

  # the "\n" is so we're not on the progress bar line
  puts "\nThe #{i}#{cardinalSuffixOf(i)} file is about to replace an " +
       "existing file named #{filename}. Do you want to do this?"
  while true
    reply = gets.chomp

    if reply.downcase == 'yes'
      puts 'Okay, the file will be replaced'
      return true

    elsif reply.downcase == 'no'
      puts 'Then the file will not be moved or renamed'
      return false

    else # don't break from loop
      puts 'Huh? Please type "yes" or "no":'

    end
  end

end

# for example, cardinalSuffixOf(53) returns "rd"
# num cannot be negative or over 100
def cardinalSuffixOf num
  case num
  when 0, 4..20
     return "th"
  when 1
     return "st"
  when 2
     return "nd"
  when 3
     return "rd"
  else
    return  cardinalSuffixOf(num % 10)
  end
end

Dir.chdir('/Users/AlexanderWu/Documents/Fotos/ruby_photos_2')
picNames = Dir['/Users/AlexanderWu/Documents/Fotos/ruby_photos/**/*.jpg']

puts 'What would you like to call this batch?'
batchName = gets.chomp
puts

print "Downloading #{picNames.length} files:  "
picNames.each_with_index do |name, i|
  print '.' # this is our "progress bar"
  i += 1 # use 1, 2, 3... instead of 0, 1, 2...
  newName = if i < 10
    "#{batchName} 0#{i}.jpg"
  else
    "#{batchName} #{i}.jpg"
  end

  if !File.exist?(newName) || verifyName(i, newName)
    File.rename(name, newName)
  end
end

puts # this is so we aren't on progress bar line.
puts 'Done! Go check it out!'
