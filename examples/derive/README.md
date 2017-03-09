# derive

Create a new column using a block. 

This method yields the given block row by row, providing the index to the 
block and returns an array suitable for assigning to a new column.

```ruby
require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :high, :low

# Create a new column, named :range
sp500[:range] = sp500.derive do |index|
  sp500[index][:high] - sp500[index][:low]
end

sp500.preview

```

# Output

```
+------------+-------------+-------------+--------------------+
| date       | high        | low         | range              |
+------------+-------------+-------------+--------------------+
| 2015-03-11 | 2050.080078 | 2039.689941 | 10.390136999999868 |
| 2015-03-12 | 2066.409912 | 2041.099976 | 25.309936000000107 |
| 2015-03-13 | 2064.560059 | 2041.170044 | 23.39001499999995  |
| 2015-03-16 | 2081.409912 | 2055.350098 | 26.059814000000188 |
| 2015-03-17 | 2080.590088 | 2065.080078 | 15.510009999999966 |
| 2015-03-18 | 2106.850098 | 2061.22998  | 45.62011799999982  |
| 2015-03-19 | 2098.689941 | 2085.560059 | 13.12988200000018  |
| 2015-03-20 | 2113.919922 | 2090.320068 | 23.59985400000005  |
| 2015-03-23 | 2114.860107 | 2104.419922 | 10.440184999999929 |
| 2015-03-24 | 2107.629883 | 2091.5      | 16.129883000000063 |
+------------+-------------+-------------+--------------------+
```