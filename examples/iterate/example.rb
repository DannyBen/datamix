require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :high, :low

sp500.iterate do |index| 
  sp500[index][:change] = sp500[index][:high] - sp500[index][:low]
end

sp500.preview
