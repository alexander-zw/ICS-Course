# Displays a formatted table of contents for a book called:
# Out of Control: the New Biology of Machines, Social Systems and the Economic World

# names of the chapters
chapters = ['THE MADE AND THE BORN', 'HIVE MIND', 'MACHINES WITH AN ATTITUDE', 'ASSEMBLING COMPLEXITY', 'COEVOLUTION', 'THE NATURAL FLUX', 'EMERGENCE OF CONTROL', 'CLOSED SYSTEMS', 'POP GOES THE BIOSPHERE', 'INDUSTRIAL ECOLOGY', 'NETWORK ECONOMICS', 'E-MONEY', 'GOD GAMES', 'IN THE LIBRARY OF FORM', 'ARTIFICIAL EVOLUTION', 'THE FUTURE OF CONTROL', 'AN OPEN UNIVERSE', 'THE STRUCTURE OF ORGANIZED CHANGE', 'POSTDARWINISM', 'THE BUTTERFLY SLEEPS', 'RISING FLOW', 'PREDICITON MACHINERY', 'WHOLES, HOLES, AND SPACES', 'THE NINE LAWS OF GOD']

# corresponding page numbers
pages = ['6', '9', '28', '55', '67', '83', '99', '112', '133', '147', '161', '176', '198', '221', '241', '267', '283', '300', '310', '328', '340', '352', '377', '392']

# find maximum length of chapters' names
maxChapterNameLength = 0
chapters.each do |chapterName|
  if chapterName.length > maxChapterNameLength
    maxChapterNameLength = chapterName.length
  end
end

chapterNumLength = 3
chapterNameLength = maxChapterNameLength + 4
pageNumLength = 4
totalLength = 'Chapter'.length + chapterNumLength + ':  '.length + chapterNameLength + 'page'.length + pageNumLength

puts 'TABLE OF CONTENTS'.center(totalLength)
puts

i = 0
while i < chapters.length
  puts 'Chapter' + (i + 1).to_s.rjust(chapterNumLength) + ':  ' + chapters[i].ljust(chapterNameLength) + 'page' + pages[i].rjust(pageNumLength)
  i += 1
end

puts 'ANNOTATED BIBLIOGRAPHY'
