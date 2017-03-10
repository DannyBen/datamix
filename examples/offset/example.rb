require 'datamix'
using DataMix

# Example 1: Understanding Offset
data = file '../_data/basic.csv'

# Create a new column named :offset, with values from the :price column
# shifted 2 rows down. Supports negative values, to shift up instead.
data[:offset] = data[:price].offset 2

# Use the #prev method as a shortcut to `offset 1`, or the #next method
# as a shortcut to `offset -1`.
data[:prev] = data[:price].prev
data.preview



# Example 2: Practical Use Case
sp500 = file '../_data/sp500.csv'
sp500.keep :date, :close

# Create a new column, :change, and populate it with close price minus
# the previous close price.
sp500[:change] = sp500[:close] - sp500[:close].prev
sp500.preview
