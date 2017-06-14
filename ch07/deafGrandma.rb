# Simulates conversation with deaf grandma

puts 'You are chatting with your deaf grandma. Say something'

while true

  input = gets.chomp
  # end conversation when you say 'BYE'
  if input == 'BYE'
    break
  # repeat nonsense when you shout in all capitals (not 'BYE')
  elsif input.upcase == input && input != ''
    randProb = rand
    if randProb < 0.6
      # a number from 1930 to 1950 inclusive
      puts 'NO, NOT SINCE ' + (rand(21) + 1930).to_s + '!'
    elsif randProb < 0.8
      puts 'YEAH, THAT WAS PRETTY FISHY!'
    else
      puts 'YES, THAT\'S WHY YOU SHOULD NEVER TRUST A BARMAN!'
    end
  # can't hear you otherwise
  else
    if rand < 0.5
      exclamation = 'HUH'
    else
      exclamation = 'WHAT'
    end
    puts exclamation + '?! SPEAK UP, SONNY!'
  end

end

# say goodbye
if rand < 0.5
  puts 'WELL, MAKE SURE YOU EAT YOUR VEGETABLES, SONNY!'
else
  # a number from 1930 to 1999
  puts 'SEE YOU IN ' + (rand(70) + 1930).to_s + ', SONNY!'
end
