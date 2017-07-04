# Simulates a baby dragon that can be born, fed, walked, and put to bed

class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly = 10 # He's full.
    @stuffInIntestine = 0 # He doesn't need to go.
    puts "#{@name} is born."
  end

  def feed
    puts "You feed #{@name}."
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts "You walk #{@name}."
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end

    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly."
    end
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private
  def hungry?
    return @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      #  Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name} is starving!  In desperation, he ate YOU!"
      exit # quit the program
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts "Whoops! #{@name} had an accident..."
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name}'s stomach grumbles..."
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name} does the potty dance..."
    end
  end

end

puts 'A new baby dragon is born. What would you like to call him?'
pet = Dragon.new(gets.chomp)

while true
  puts 'What do you do?'
  puts

  case gets.chomp.downcase
  when 'feed'
    pet.feed

  when 'walk'
    pet.walk

  when 'rock'
    pet.rock

  when 'toss'
    pet.toss

  when 'put to bed'
    pet.putToBed

  when 'leave', 'quit', 'exit'
    puts 'You leave your baby dragon and go away. This makes you sad. You ' +
         'decide to adopt another baby dragon next year'
    break

  else
    print 'Hmm... Nothing happened. '
  end
end
