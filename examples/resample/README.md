# resample

Resample a single column or an entire table.

This method creates a new series that is similar to the original. It 
will slice the series to several random parts, shufle and glue them 
together in such a way that the result resembles the original series.

When calling this method, pass in a range to determine the minimum and 
maximum size of each slice.

When resampling a table, the series will remain in sync.

```ruby
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

```

# Output

```
+------------+-------+--------+
| date       | apple | orange |
+------------+-------+--------+
| 2015-03-11 | 10    | 100    |
| 2015-03-12 | 12    | 120    |
| 2015-03-13 | 10    | 100    |
| 2015-03-16 | 12    | 120    |
| 2015-03-17 | 14    | 140    |
| 2015-03-18 | 16    | 160    |
| 2015-03-19 | 18    | 180    |
| 2015-03-20 | 20    | 200    |
| 2015-03-23 | 22    | 220    |
| 2015-03-24 | 20    | 200    |
| 2015-03-25 | 22    | 220    |
| 2015-03-26 | 24    | 240    |
| 2015-03-27 | 26    | 260    |
| 2015-03-30 | 24    | 240    |
| 2015-03-31 | 26    | 260    |
| 2015-04-01 | 28    | 280    |
| 2015-04-02 | 30    | 300    |
| 2015-04-06 | 28    | 280    |
| 2015-04-07 | 30    | 300    |
+------------+-------+--------+
+------------+-------+-----------+
| date       | apple | resampled |
+------------+-------+-----------+
| 2015-03-11 | 10    | 10        |
| 2015-03-12 | 12    | 12        |
| 2015-03-13 | 10    | 10        |
| 2015-03-16 | 12    | 12        |
| 2015-03-17 | 14    | 10        |
| 2015-03-18 | 16    | 12        |
| 2015-03-19 | 18    | 14        |
| 2015-03-20 | 20    | 12        |
| 2015-03-23 | 22    | 10        |
| 2015-03-24 | 20    | 12        |
+------------+-------+-----------+
```
