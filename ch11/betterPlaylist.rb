=begin
Builds a playlist in a .m3u file from music in the directory
'/Users/AlexanderWu/Music/iTunes/iTunes Media/Music/Owl City'
Shuffles playlist if user requests it. Name of playlist entered by user

When shuffing, first randomly shuffles the pathnames, then reshuffles them by
finding the first level in the pathnames that varies (counting from the left)
and checking for consecutive identical folders and separates them when found

This doesn't guarentee that music from the same folder won't end up together
but it helps (I hope)

For example, if after shuffling the music pathnames are:
me/music/rock/rock_the_house.mp3
me/music/rock/rock_everything.mp3
me/music/jazz/good_jazz/i_am_happy.mp3
me/music/jazz/you_are_sad.mp3
me/music/pop/everything_is_awesome.mp3
me/music/rock/bad_rock/rock_the_park.mp3
The method mixUp will determine that the first variable level is 2,
the level with jazz, rock, and pop, and that's the only level it will care
about. Since the first two level 2 folders are both 'rock', the second
song will be moved somewhere else in the list. It may be moved somewhere
where it's still next to another 'rock' song, even moved to the same location
it is now (which isn't really moving), but it's more likely to be mixed up.
The same goes for the third and fourth songs. mixUp only goes through the
list once
=end

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

# first randomly shuffles musicArr then reshuffles them by finding the first
# level of directories in the pathnames that varies (counting from the left)
# and checking for consecutive identical folders and separates them when found
def mixUp musicArr
  musicArr = shuffle(musicArr)

  # find the level where the folder first starts to vary
  pathnameLevelsArr = []
  levelVaries = [] # boolean array, true if this level of pathname varies
  musicArr.each_with_index do |pathname, i|
    pathnameLevelsArr.push(pathname.split('/'))
    pathnameLevelsArr[i].each_with_index do |level, j|
      # the folder at this level was different from the last pathname
      # (if there was a last one)
      levelVaries[j] = true if i != 0 && level != pathnameLevelsArr[i - 1][j]
    end
  end
  varyingLevel = -1
  levelVaries.each_with_index do |varies, i|
    if varies
      varyingLevel = i
      break
    end
  end

  # move consecutive same-folder music away from each other
  pathnameLevelsArr.each_with_index do |levels, i|
      # the folder at this level is the same as the next pathname
      # (if there is a next one)
     if i != pathnameLevelsArr.length - 1 &&
        levels[varyingLevel] == pathnameLevelsArr[i + 1][varyingLevel]
       # move the next one somewhere else (may be the same place though)
       pathnameLevelsArr.insert(rand(pathnameLevelsArr.length),
          pathnameLevelsArr.delete_at(i + 1))
     end
   end

   # these lines are used to compare before-after effects when testing
   #  puts musicArr.join
   #  puts

   # copy changes to musicArr and return
   musicArr = []
   pathnameLevelsArr.each do |levels|
     musicArr.push(levels.join('/'))
   end
   return musicArr
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
musicNames = mixUp(musicNames) if verifyShuffle

puts 'What would you like to call this playlist?'
playlistName = gets.chomp

savePlaylist(musicNames, playlistName)
puts 'Done! Go check it out!'

# the code below was used for testing and is an excellent example of how this
# algorithm works. If you want to use it, please also uncomment lines 89..90
# arr = ['1', '1', '1', '2', '2', '2', '2', '2', '3', '3', '4']
# puts mixUp(arr).join
