require 'datamix'
using DataMix

sp500 = file '../_data/empties.csv'

puts "\nBefore:"
sp500.preview

sp500.delete_empty_rows

puts "\nAfter:"
sp500.preview
