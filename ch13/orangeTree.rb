# Simulates an orange tree that can grow taller, produce oranges, have oranges
# picked, and die

class OrangeTree

  def initialize
    @age = 0 # in years
    @height = 2 # in inches
    @oranges = 0
    @dead = false
  end

  # simulates aging by one year: increase age, height, and possibly number of
  # oranges; returns a message about what happened this year
  def oneYearPasses

    # accidental deaths
    if rand < 0.08
      @dead = true
      case rand(3)
      when 0
        return 'Your tree was struck by a bolt of lightning and died!'
      when 1
        return 'The orange tree was infected by a plague and you couldn\'t ' +
               'cure it.'
      else
        return 'Your neighbor accidentally bumped into your tree with his ' +
               'truck and killed it'
      end
    end

    # age-related deaths; minimum age is 3, more likely do die when older,
    # cannot live past 12 years
    if !@dead && age > rand(10) + 2
      @dead = true
      if rand < 0.5
        return 'Your tree is too old and fell over'
      else
        return 'The orange tree withered and died'
      end
    end

    @age += 1
    @height += 8 + rand(8)
    oldOranges = @oranges
    # grow oranges after 2 years
    @oranges = age + rand(age / 2) if @age > 2
    return "#{oldOranges} orange#{(oldOranges == 1)? '' : 's'} fell to the" +
           ' ground because you didn\'t pick ' +
           "#{(oldOranges == 1)? 'it' : 'them'}" if oldOranges > 0
    return 'Another year went by with nothing happening'

  end

  def height
    return @height
  end

  def age
    return @age
  end

  # returns the number of oranges on the tree
  def orangeCount
    return @oranges
  end

  def dead?
    return @dead
  end

  # returns a message about the oranged picked (or the fact that there are
  # no oranges left)
  def pickAnOrange
    if @oranges > 0
      @oranges -= 1
      case rand(4)
      when 0
        return 'You chose a particularly big and juicy one. It tastes ' +
               'very good'
      when 1
        return 'You make orange juice with the orange. Everybody likes it'
      when 2
        return 'You give the orange to grandma. A wolf disguised as her ' +
               'eats you instead and you are saved by a hunter. Just kidding'
      when 3
        return 'You eat the orange but forget to peel it first'
      end
    end
    return 'The tree is out of oranges! You grab a bunch of leaves instead'
  end

end

tree = OrangeTree.new
print 'You\'ve planted an orange tree in your backyard. '

while true
  puts 'What do you do?'

  case gets.chomp.downcase
  when '', 'nothing', 'wait'
    puts tree.oneYearPasses
    puts "The tree is now #{tree.age} year#{(tree.age == 1)? '' : 's'} old " +
         "and #{tree.height} inches tall"
    if tree.dead?
      print 'Yet the tree is dead. '
      break
    end
    puts

  when 'count', 'count oranges'
    puts 'You count the number of oranges on your tree with pride'
    oranges = tree.orangeCount
    if oranges == 0
      puts 'But there is nothing on the tree but leaves'
    else
      puts "You see #{oranges} big orange#{(oranges == 1)? '' : 's'} on the" +
           " tree"
      puts 'One fell off and bumped his knee. Just kidding' if rand < 0.5
    end

  when 'pick', 'pick orange', 'pick an orange'
    print 'You go pick an orange from the tree. '
    puts tree.pickAnOrange

  when 'quit', 'exit', 'leave'
    print 'You leave your orange tree in the backyard and move away. '
    break

  else
    print 'Hmm... Nothing happened. '
  end
end

puts 'This makes you sad. You decide to plant another orange tree next year'
