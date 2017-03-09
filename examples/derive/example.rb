require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :high, :low

# Create a new column, named :range
sp500[:range] = sp500.derive do |index|
  sp500[index][:high] - sp500[index][:low]
end

sp500.preview
