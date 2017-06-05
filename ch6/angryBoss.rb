# Angry boss program: rudely asks what you want
# and then fires you no matter what you say

# Use a random number to generate a rude version of "what do you want"
randInt = rand(7)
case randInt
when 0
  question = 'YOU STILL NOT SATISFIED??? WHAT DO YOU WANT???'
when 1
  question = 'YOU BASTARD WANT ANYTHING??'
when 2
  question = 'WHAT YA WANT NOW?!?'
when 3
  question = 'WHADDARE YOU DOING HERE? WANTING ANYTHING???'
when 4
  question = 'WHA YE PLAYING AT?? WHA YE WANT?!?'
when 5
  question = 'I KNOW YOU WANT SOMETHING! SPIT IT OUT!!'
when 6
  question = 'WHAT IS IT YA WANT OUTTA ME?!?'
else
  question = 'ERROR: RAND_INT OUT OF RANGE'
end

puts question

upcaseAnswer = gets.chomp.upcase

# Use a random number to generate the first part of boss' answer
randInt = rand(7)
case randInt
when 0
  firstPartBossAnswer = 'WHADDA YA MEAN '
when 1
  firstPartBossAnswer = 'WHAT??? '
when 2
  firstPartBossAnswer = 'WHY YE SAY '
when 3
  firstPartBossAnswer = ''
when 4
  firstPartBossAnswer = 'WHAT THE BLOODY HELL DO YOU MEAN '
when 5
  firstPartBossAnswer = 'YOU BASTARD!!! WHAT '
when 6
  firstPartBossAnswer = 'HMPH!! '
else
  firstPartBossAnswer = "ERROR: RAND_INT OUT OF RANGE\n"
end
# Sometimes add 'HUH? ' to increase variety
if rand < 0.5
  firstPartBossAnswer = 'HUH? ' + firstPartBossAnswer
end

puts firstPartBossAnswer + '"' + upcaseAnswer + '"?!? YOU\'RE FIRED!!'
