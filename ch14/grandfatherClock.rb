# Contains a method that calls a block once for each hour that has passed
# since 12:00
# The rest of the program tests the method

# calls a block n times, where n is the time in hours
# e.g. if it's 7:45, calls 7 times, if it's 12:30, calls 12 times
def chime
  # shift then take modulus so that the outcome is 1 to 12
  ((Time.new.hour - 1) % 12 + 1).times { yield }
end

chime { print 'DONG! ' }
puts

i = 1
chime do
  puts "The clock strikes #{i}"
  i += 1
end

# I just thought this was funny please don't think too poorly of me
words = ['ice-cream', 'soda',      'cherry on', 'the top',   'who\'s your',
         'boyfriend', 'I don\'t',  'know'     , 'is it A',   'B',
         'C',         'D']
i = 0
chime do
  puts words[i]
  i += 1
end
