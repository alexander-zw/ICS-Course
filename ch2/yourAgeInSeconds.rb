# Calculates Alexander Wu’s age in seconds
# I was born on March 11, 2000, about 5:00 AM
# It is now May 23, 2017 about 6:00 PM (I'm not going to update this)

# Here comes the hard part
# The amount of seconds from 5:00 AM March 11, 2000 to 5:00 AM March 11, 2017, ignoring leap years, is:
# 3600 s/h * 24 h/d * 365 d/yr * 17 yr

# Considering leap years, there are 4 leap years between these dates (2004, 2008, 2012, 2016)
# And let's ignore any further inaccuracies like relativity or corrections by the US Naval Observatory
# The number of days added is 4 d

# The amount of hours between 5:00 AM March 11 and 6:00 PM May 23 is:
# 24 h/d * ((32 - 11) d in March + 30 d in April + 23 d in May) + 11 h

# Therefore:
puts 3600 * (24 * (365 * 17 - 4 + 32 - 11 + 30 + 23) + 11)
