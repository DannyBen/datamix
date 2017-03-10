require 'datamix'
using DataMix

data = file '../_data/sp500.csv'

data.keep :date, :high, :low

# Create a new column, :range, with the values of :high - :low
data[:range] = data[:high] - data[:low]

data.round :range, decimals: 2
data.preview
