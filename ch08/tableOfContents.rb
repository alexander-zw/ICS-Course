# Displays a formatted table of contents for a book called:
# Out of Control: the New Biology of Machines, Social Systems and the Economic World

# names of the chapters and corresponding pages
chapters = [['THE MADE AND THE BORN', 6], ['HIVE MIND', 9], ['MACHINES WITH AN ATTITUDE', 28],
            ['ASSEMBLING COMPLEXITY', 55], ['COEVOLUTION', 67], ['THE NATURAL FLUX', 83],
            ['EMERGENCE OF CONTROL', 99], ['CLOSED SYSTEMS', 112], ['POP GOES THE BIOSPHERE', 133],
            ['INDUSTRIAL ECOLOGY', 147], ['NETWORK ECONOMICS', 161], ['E-MONEY', 176],
            ['GOD GAMES', 198], ['IN THE LIBRARY OF FORM', 221], ['ARTIFICIAL EVOLUTION', 241],
            ['THE FUTURE OF CONTROL', 267], ['AN OPEN UNIVERSE', 283], ['THE STRUCTURE OF ORGANIZED CHANGE', 300],
            ['POSTDARWINISM', 310], ['THE BUTTERFLY SLEEPS', 328], ['RISING FLOW', 340],
            ['PREDICITON MACHINERY', 352], ['WHOLES, HOLES, AND SPACES', 377], ['THE NINE LAWS OF GOD', 392]]

# find maximum length of chapters' names
maxChapterNameLength = 0
chapters.each do |chapter|
  if chapter[0].length > maxChapterNameLength
    maxChapterNameLength = chapter[0].length
  end
end

# define space for each component
chapterNumSpace = 3
chapterNameSpace = maxChapterNameLength + 4 # add four spaces for neatness
pageNumSpace = 4
totalLength = 'Chapter'.length + chapterNumSpace + ':  '.length + chapterNameSpace + 'page'.length + pageNumSpace

# display table of contents
puts 'TABLE OF CONTENTS'.center(totalLength)
puts

# display each chapter
chapters.each_with_index do |chapter, i|
  puts 'Chapter' + (i + 1).to_s.rjust(chapterNumSpace) + ':  ' + chapter[0].ljust(chapterNameSpace) + 'page' + chapter[1].to_s.rjust(pageNumSpace)
end

puts 'ANNOTATED BIBLIOGRAPHY'.ljust(totalLength - 'page'.length - pageNumSpace) + 'page' + '398'.rjust(pageNumSpace)
