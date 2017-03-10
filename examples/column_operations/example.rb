require 'datamix'
using DataMix

data = file '../_data/sp500.csv'

data.keep :date, :high, :low

# Create a new column, :range, with the values of :high - :low
data[:range] = data[:high] - data[:low]

# Create a new column, :double, with the value of :range multiplied by 2
data[:double] = (data[:range] * 2).round

data.round :range, decimals: 2
data.preview
