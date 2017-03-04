# extract

Extract a regular expression pattern from a column and return a new column.

```ruby
require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

sp500.keep :date, :close

# Get only the year and month from the date, and assign it to a new column, 
# named :month
sp500[:month] = sp500.extract /\d{4}-\d{2}/, from: :date

sp500.preview

```
# Output

```
+------------+-------------+---------+
| date       | close       | month   |
+------------+-------------+---------+
| 2015-03-11 | 2040.23999  | 2015-03 |
| 2015-03-12 | 2065.949951 | 2015-03 |
| 2015-03-13 | 2053.399902 | 2015-03 |
| 2015-03-16 | 2081.189941 | 2015-03 |
| 2015-03-17 | 2074.280029 | 2015-03 |
| 2015-03-18 | 2099.5      | 2015-03 |
| 2015-03-19 | 2089.27002  | 2015-03 |
| 2015-03-20 | 2108.100098 | 2015-03 |
| 2015-03-23 | 2104.419922 | 2015-03 |
| 2015-03-24 | 2091.5      | 2015-03 |
+------------+-------------+---------+
```
