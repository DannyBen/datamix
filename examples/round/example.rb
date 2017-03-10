require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

# Option 1, call #round on the data table
sp500.keep :date, :open, :close, :volume
sp500.round :close, decimals: 2
sp500.round :volume

# Option 2, call #round on the column
sp500[:open] = sp500[:open].round 1

sp500.preview
