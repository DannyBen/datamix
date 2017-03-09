# keep

Keep only selected columns, discard the rest.

```ruby
require 'datamix'
using DataMix

sp500 = file '../_data/sp500.csv'

puts "Headers:"
p sp500.headers

sp500.keep :date, :close

puts "\nPreview:"
sp500.preview

```

# Output

```
Headers:
[:date, :open, :high, :low, :close, :volume, :adjusted_close]

Preview:
+------------+-------------+
| date       | close       |
+------------+-------------+
| 2015-03-11 | 2040.23999  |
| 2015-03-12 | 2065.949951 |
| 2015-03-13 | 2053.399902 |
| 2015-03-16 | 2081.189941 |
| 2015-03-17 | 2074.280029 |
| 2015-03-18 | 2099.5      |
| 2015-03-19 | 2089.27002  |
| 2015-03-20 | 2108.100098 |
| 2015-03-23 | 2104.419922 |
| 2015-03-24 | 2091.5      |
+------------+-------------+
```
