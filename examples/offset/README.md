# offset

Shift column data one or more rows up or down.

```ruby
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

```

# Output

```
+------------+-------+--------+------+
| date       | price | offset | prev |
+------------+-------+--------+------+
| 2015-03-11 | 2044  |        |      |
| 2015-03-12 | 2041  |        | 2044 |
| 2015-03-13 | 2064  | 2044   | 2041 |
| 2015-03-16 | 2055  | 2041   | 2064 |
| 2015-03-17 | 2080  | 2064   | 2055 |
| 2015-03-18 | 2072  | 2055   | 2080 |
| 2015-03-19 | 2098  | 2080   | 2072 |
| 2015-03-20 | 2090  | 2072   | 2098 |
| 2015-03-23 | 2107  | 2098   | 2090 |
| 2015-03-24 | 2103  | 2090   | 2107 |
+------------+-------+--------+------+
+------------+-------------+---------------------+
| date       | close       | change              |
+------------+-------------+---------------------+
| 2015-03-11 | 2040.23999  |                     |
| 2015-03-12 | 2065.949951 | 25.70996100000002   |
| 2015-03-13 | 2053.399902 | -12.550048999999944 |
| 2015-03-16 | 2081.189941 | 27.79003899999998   |
| 2015-03-17 | 2074.280029 | -6.909912000000077  |
| 2015-03-18 | 2099.5      | 25.219970999999987  |
| 2015-03-19 | 2089.27002  | -10.229980000000069 |
| 2015-03-20 | 2108.100098 | 18.830077999999958  |
| 2015-03-23 | 2104.419922 | -3.6801759999998467 |
| 2015-03-24 | 2091.5      | -12.919922000000042 |
+------------+-------------+---------------------+
```
