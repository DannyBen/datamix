# join

Join columns from another data table based on a mutual column.

```ruby
require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'
sp500.keep :date, :close
sp500.rename :close, to: :sp500

vix = file '../_data/vix.csv'
vix.keep :date, :close
vix.rename :close, to: :vix

sp500.join vix, on: :date

sp500.preview

```

# Output

```
+------------+-------------+-----------+
| date       | sp500       | vix       |
+------------+-------------+-----------+
| 2015-03-11 | 2040.23999  | 16.870001 |
| 2015-03-12 | 2065.949951 | 15.42     |
| 2015-03-13 | 2053.399902 | 16.0      |
| 2015-03-16 | 2081.189941 | 15.61     |
| 2015-03-17 | 2074.280029 | 15.66     |
| 2015-03-18 | 2099.5      | 13.97     |
| 2015-03-19 | 2089.27002  | 14.07     |
| 2015-03-20 | 2108.100098 | 13.02     |
| 2015-03-23 | 2104.419922 | 13.41     |
| 2015-03-24 | 2091.5      | 13.62     |
+------------+-------------+-----------+
```
