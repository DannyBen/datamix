require 'datamix'
using DataMix

# Load a file into a CSV::Table object.
sp500 = file '../_data/basic.csv'

# Print the first 10 rows
sp500.preview
