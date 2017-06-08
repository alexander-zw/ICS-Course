# Displays a formatted table of contents for a book called:
# Out of Control: the New Biology of Machines, Social Systems and the Economic World
# Since I can't use arrays, I'll only write out the first three chapters

chapterNumLength = 3
chapterNameLength = 'THE STRUCTURE OF ORGANIZED CHANGE'.length + 4
pageNumLength = 4
totalLength = 'Chapter'.length + chapterNumLength + ':  '.length + chapterNameLength + 'page'.length + pageNumLength

puts 'TABLE OF CONTENTS'.center(totalLength)
puts

puts 'Chapter' + '1'.rjust(chapterNumLength) + ':  ' + 'THE MADE AND THE BORN'.ljust(chapterNameLength) + 'page' + '6'.rjust(pageNumLength)
puts 'Chapter' + '2'.rjust(chapterNumLength) + ':  ' + 'HIVE MIND'.ljust(chapterNameLength) + 'page' + '9'.rjust(pageNumLength)
puts 'Chapter' + '3'.rjust(chapterNumLength) + ':  ' + 'MACHINES WITH AN ATTITUDE'.ljust(chapterNameLength) + 'page' + '28'.rjust(pageNumLength)

puts 'ANNOTATED BIBLIOGRAPHY'
