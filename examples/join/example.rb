require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'
sp500.keep :date, :close
sp500.rename :close, to: :sp500

vix = file '../_data/vix.csv'
vix.keep :date, :close
vix.rename :close, to: :vix

sp500.join vix, on: :date

sp500.preview
