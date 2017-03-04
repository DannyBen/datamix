require 'datamix'
using DataMix

# Load a file into a CSV::Table object.
sp500 = file '../_data/sp500.csv'

puts "Headers:"
p sp500.headers

# Keep only selected columns
sp500.keep :date, :close

# Print the first 10 rows
puts "\nPreview:"
sp500.preview
