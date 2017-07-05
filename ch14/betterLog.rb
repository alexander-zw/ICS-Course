# Includes a method that shows when a block begins, ends, and what it returns
# The logs are indented according to how deeply nested the log is
# Then tests the method

$logDepth = 0

# shows when a block begins, ends, and what it returns
def log description
  indent("Beginning \"#{description}\"...", $logDepth)
  $logDepth += 1
  returnVal = yield
  $logDepth -= 1
  indent("... \"#{description}\" finished, returning: #{returnVal}",
         $logDepth)
  return returnVal
end

def indent message, numTimes
  numTimes.times { print '   ' }
  puts message
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

    maxInArr > 95
  end

  'Goodbye!'
end
