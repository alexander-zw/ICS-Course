# Contains a method that shows how much time a block of code takes to execute
# Then compares the execution times of several blocks

def profile blockDescription
  if true # profile if this is true
    startTime = Time.new
    yield
    duration = Time.new - startTime
    puts "#{blockDescription}: #{duration} seconds"
  else
    yield
  end
end

if false # test doublings if true, else test yield
  profile '100000 increments' do
    number = 1
    100000.times do
      number += 1
    end
    puts "#{number.to_s.length} digits"
  end

  profile '100000 doublings with "+"' do
    number = 1
    100000.times do
      number = number + number
    end
    puts "#{number.to_s.length} digits"
  end

  profile '100000 doublings with "*"' do
    number = 1
    100000.times do
      number = number * 2
    end
    puts "#{number.to_s.length} digits"
  end

  profile '100000 doublings with "*="' do
  number = 1
  100000.times do
    number *= 2
  end
  puts "#{number.to_s.length} digits"
end

else
  def doWithCall num, &someBlock
    100000.times { someBlock.call(num) }
  end

  def doWithYield num
    100000.times { yield(num) }
  end

  profile 'add 100000 times with call' do
    doWithCall 100 do |num|
      num + num
    end
  end

  profile 'add 100000 times with yield' do
    doWithYield 100 do |num|
      num + num
    end
  end

end
