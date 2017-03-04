require 'datamix'
using DataMix

# Load a file into a CSV::Table object.
sp500 = file '../_data/sp500.csv'

puts "Headers:"
p sp500.headers

# Remove selected columns
sp500.remove :adjusted_close, :volumn, :open, :high, :low

# Print the first 10 rows
puts "\nPreview:"
sp500.preview
