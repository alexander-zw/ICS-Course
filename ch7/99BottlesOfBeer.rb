# Prints out the lyrics of "99 Bottles of Beer on the Wall"

# number of characters in one line (including spaces)
lineLength = 50

# align all words to the center
puts '99 Bottles of Beer on the Wall'.center(lineLength)
puts



i = 99
# Execute once, then keep executing until i gets to 0 and is reassigned 99
# then exit loop
begin
  # print number of bottles except when i is 0, then print 'No more'
  # use 'bottles' except when i is 1, then use 'bottle'
  puts (((i == 0)? 'No more' : i.to_s) + ' bottle' + ((i == 1)? '' : 's') + ' of beer on the wall,').center(lineLength)
  puts (((i == 0)? 'No more' : i.to_s) + ' bottle' + ((i == 1)? '' : 's') + ' of beer').center(lineLength)
  if i == 0
    puts ('Go to the store and buy some more,').center(lineLength)
    i = 99
  else
    # use 'one' except when i is 1, then use 'it'
    puts ('Take ' + ((i == 1)? 'it' : 'one') + ' down, pass it around,').center(lineLength)
    i -= 1
  end
  puts (((i == 0)? 'No more' : i.to_s) + ' bottle' + ((i == 1)? '' : 's') + ' of beer on the wall').center(lineLength)
  puts
end until i == 99
