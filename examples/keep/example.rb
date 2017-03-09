require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

puts "Headers:"
p sp500.headers

sp500.keep :date, :close

puts "\nPreview:"
sp500.preview
