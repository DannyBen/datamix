require 'datamix'
using DataMix

data = file '../_data/resample.csv'

# Resample an entire table, exclude the :date column
data.resample 3..6, except: [:date]
data.show 20

# Resample a single series
data.remove :orange
data[:resampled] = data[:apple].resample 3..6
data.preview
