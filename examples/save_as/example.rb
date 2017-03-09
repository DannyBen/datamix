require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :close, :volume
sp500.save_as 'output.csv'
sp500.save_as 'output.tsv'
