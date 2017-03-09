require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :close

# Get only the year and month from the date, and assign it to a new column, 
# named :month
sp500[:month] = sp500.extract /\d{4}-\d{2}/, from: :date

sp500.preview
