require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :close, :volume
sp500.round :close, decimals: 2
sp500.round :volume

sp500.preview
