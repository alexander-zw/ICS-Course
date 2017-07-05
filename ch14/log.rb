# Includes a method that shows when a block begins, ends, and what it returns
# Then tests the method

# shows when a block begins, ends, and what it returns
def log description
  puts "Beginning \"#{description}\"..."
  returnVal = yield
  puts "... \"#{description}\" finished, returning: #{returnVal}"
  return returnVal
end

log 'biggest block' do

  log 'second biggest block' do

    log 'say hi' do
      log('puts') { puts 'Hi!' }
      'Hello!'
    end

    arr = []
    log 'create random array' do
      # push 20 random values from 0 to 99
      20.times do
        arr.push(rand(100))
      end
      arr
    end

    maxInArr = log 'find largest element' do
      # find maximum number in arr
      maxNum = 0
      arr.each do |num|
        if num > maxNum
          maxNum = num
        end
      end
      maxNum
    end

    maxInArr > 90
  end

  'Goodbye!'
end
