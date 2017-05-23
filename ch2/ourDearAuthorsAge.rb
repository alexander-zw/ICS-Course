# Calculates the age of Chris Pine in years given the age in seconds, 1.16 billion

# We will find the age in floating-point form
# We assume that one year is 365.25 days
# 1.16E9 s / (3600 s/h * 24 h/d * 365.25 d/y)
puts 1.16E9 / (3600 * 24 * 365.25)
