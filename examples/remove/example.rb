require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

puts "Headers:"
p sp500.headers

sp500.remove :adjusted_close, :volumn, :open, :high, :low

puts "\nPreview:"
sp500.preview
