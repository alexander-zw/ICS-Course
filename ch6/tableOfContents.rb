# Displays a formatted table of contents for a book called:
# Out of Control: the New Biology of Machines, Social Systems and the Economic World
# Since I can't use arrays, I'll only write out the first three chapters

chapterNumSpace = 3
chapterNameSpace = 'THE STRUCTURE OF ORGANIZED CHANGE'.length + 4
pageNumSpace = 4
totalLength = 'Chapter'.length + chapterNumSpace + ':  '.length + chapterNameSpace + 'page'.length + pageNumSpace

puts 'TABLE OF CONTENTS'.center(totalLength)
puts

puts 'Chapter' + '1'.rjust(chapterNumSpace) + ':  ' + 'THE MADE AND THE BORN'.ljust(chapterNameSpace) + 'page' + '6'.rjust(pageNumSpace)
puts 'Chapter' + '2'.rjust(chapterNumSpace) + ':  ' + 'HIVE MIND'.ljust(chapterNameSpace) + 'page' + '9'.rjust(pageNumSpace)
puts 'Chapter' + '3'.rjust(chapterNumSpace) + ':  ' + 'MACHINES WITH AN ATTITUDE'.ljust(chapterNameSpace) + 'page' + '28'.rjust(pageNumSpace)

puts 'ANNOTATED BIBLIOGRAPHY'.ljust(totalLength - 'page'.length - pageNumSpace) + 'page' + '398'.rjust(pageNumSpace)
