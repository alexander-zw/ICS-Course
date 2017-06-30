# Reads president birthdays from a file, stores them in a hash, then asks for
# a name and outputs the president's next birthday and how old he will be then

# returns a hash of president birthdays (a string with president's name
# pointing to a Time object of the bithdays) read from a file
def readBirthdays filename
  birthdays = {}
  lines = File.read(filename).split("\n")
  lines.each do |line|
    components = line.split(',')
    # separate month and day
    monthAndDay = components.delete_at(1).split(' ') # extra spaces gone
    components.insert(1, monthNumberOf(monthAndDay[0]), monthAndDay[1])
    components[3] = components[3].strip # only one more space to remove
    # store in hash
    birthdays[components[0]] = # assume it's Greenwich mean time
        Time.gm(components[3], components[1], components[2])
  end
  return birthdays
end

# returns number version of three-letter month (capitalized)
# e.g. monthNumberOf('Feb') == 2
def monthNumberOf strMonth
  months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  return months.find_index(strMonth) + 1
end

# returns month string according the the month number
# e.g. strMonthOf(2) == 'February'; doesn't work if monthNumber is out of range
def strMonthOf monthNumber
  monthArr = ['January',   'February',  'March',     'April',
              'May',       'June',      'July',      'August',
              'September', 'October',   'November',  'December']
  return monthArr[monthNumber - 1]
end

# returns how old someone with birthday birthday will be on their next birthday
def yearsOld birthday
  now = Time.new
  yearsOld = now.year - birthday.year
  # if birthday is today or later in the year
  if now.month > birthday.month ||
     (now.month == birthday.month && now.day >= birthday.day)
    yearsOld += 1
  end
  return yearsOld
end

birthdays = readBirthdays('/Users/AlexanderWu/ICS-Course/ch12/' +
                          'president_birthdays.txt')
puts 'I know the birthdays of all the presidents. Please tell me a name'
while true
  name = gets.chomp
  birthday = birthdays[name]
  if birthday != nil
    puts "#{name}'s next birthday will be on #{birthday.strftime("%B %d")}. " +
         "He will be #{yearsOld(birthday)} years old"
    break
  end
  puts 'Was that one of our presidents? Please enter the full name'
end
