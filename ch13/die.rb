# Simulates a die that can be rolled, viewed, or set at any value

class Die

  # the number showing is randomly chosen
  def initialize
    roll
  end

  # the number showing is set as number if number was valid
  # otherwise it is randomly chosen
  def initialize number
    roll unless cheat(number)
  end

  # roll the die so the number showing is randomly chosen
  def roll
    @numberShowing = 1 + rand(6)
  end

  # attempts to set the number showing to number and
  # returns if cheat was successful
  def cheat number
    if number > 0 && number < 7
      @numberShowing = number
      return true
    end
    return false
  end

  # returns the number showing
  def showing
    return @numberShowing
  end

end

die = Die.new(1)
while true
  puts 'Now what would you like the die to do?'
  case gets.chomp.downcase
  when 'show'
    puts "The die shows you that its favorite number is #{die.showing}"
  when 'roll'
    die.roll
    puts "The die is tumbling around the edges of the table"
  when 'cheat'
    puts 'You want to set the number to?'
    number = gets.chomp.to_i
    if die.cheat(number)
      puts "The die has reluctantly set the number showing to #{number}"
    else
      puts 'The die is mad at you for trying to tease it'
    end
  when 'quit', 'exit'
    puts 'Goodbye!'
    break
  else
    puts 'The die is staring at you blankly'
  end
end
