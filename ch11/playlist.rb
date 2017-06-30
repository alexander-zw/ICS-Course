# Builds a playlist in a .m3u file from music in the directory
# '/Users/AlexanderWu/Music/iTunes/iTunes Media/Music/Owl City'
# Shuffles playlist if user requests it. Name of playlist entered by user

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

# saves musicArr as playlist in a file named filename,
# where filename doesn't include the '.m3u' extension
def savePlaylist musicArr, filename
  musicStr = ''
  musicArr.each do |musicFile|
    musicStr += musicFile + "\n"
  end
  File.open filename + '.m3u', 'w' do |f|
    f.write(musicStr)
  end
end

# returns whether user wants to shuffle
def verifyShuffle
  while true
    reply = gets.chomp.downcase

    if reply == 'yes'
      puts 'Okay, shuffling...'
      return true
    end
    if reply == 'no'
      print 'Right. '
      return false
    end
    puts 'Huh? Please type "yes" or "no":'

  end
end

Dir.chdir('/Users/AlexanderWu/Documents/Otros/Music')
musicNames = Dir['/Users/AlexanderWu/Music/iTunes/iTunes Media/Music/' +
               'Owl City/**/*.m4a']

puts 'Would you like to shuffle this playlist?'
musicNames = shuffle(musicNames) if verifyShuffle

puts 'What would you like to call this playlist?'
playlistName = gets.chomp

savePlaylist(musicNames, playlistName)
puts 'Done! Go check it out!'
