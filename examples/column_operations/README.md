# column_operations

You can use + - * and / directly on columns.
These operations are defined as Array refinements, and they
return an array, which makes it suitable for assigning to new columns.

```ruby
require 'datamix'
using DataMix

data = file '../_data/sp500.csv'

data.keep :date, :high, :low

# Create a new column, :range, with the values of :high - :low
data[:range] = data[:high] - data[:low]

data.round :range, decimals: 2
data.preview

```

# Output

```
+------------+-------------+-------------+-------+
| date       | high        | low         | range |
+------------+-------------+-------------+-------+
| 2015-03-11 | 2050.080078 | 2039.689941 | 10.39 |
| 2015-03-12 | 2066.409912 | 2041.099976 | 25.31 |
| 2015-03-13 | 2064.560059 | 2041.170044 | 23.39 |
| 2015-03-16 | 2081.409912 | 2055.350098 | 26.06 |
| 2015-03-17 | 2080.590088 | 2065.080078 | 15.51 |
| 2015-03-18 | 2106.850098 | 2061.22998  | 45.62 |
| 2015-03-19 | 2098.689941 | 2085.560059 | 13.13 |
| 2015-03-20 | 2113.919922 | 2090.320068 | 23.6  |
| 2015-03-23 | 2114.860107 | 2104.419922 | 10.44 |
| 2015-03-24 | 2107.629883 | 2091.5      | 16.13 |
+------------+-------------+-------------+-------+
```
