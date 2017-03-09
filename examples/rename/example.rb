require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :close
sp500.rename :close, to: :price
sp500.preview
