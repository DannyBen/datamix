# remove

Remove selected columns.

```ruby
require 'datamix'
using DataMix

# Load a file into a CSV::Table object.
sp500 = file '../_data/sp500.csv'

puts "Headers:"
p sp500.headers

# Remove selected columns
sp500.remove :adjusted_close, :volumn, :open, :high, :low

# Print the first 10 rows
puts "\nPreview:"
sp500.preview

```
# Output

```
Headers:
[:date, :open, :high, :low, :close, :volume, :adjusted_close]

Preview:
+------------+-------------+--------------+
| date       | close       | volume       |
+------------+-------------+--------------+
| 2015-03-11 | 2040.23999  | 3406570000.0 |
| 2015-03-12 | 2065.949951 | 3405860000.0 |
| 2015-03-13 | 2053.399902 | 3498560000.0 |
| 2015-03-16 | 2081.189941 | 3295600000.0 |
| 2015-03-17 | 2074.280029 | 3221840000.0 |
| 2015-03-18 | 2099.5      | 4128210000.0 |
| 2015-03-19 | 2089.27002  | 3305220000.0 |
| 2015-03-20 | 2108.100098 | 5554120000.0 |
| 2015-03-23 | 2104.419922 | 3267960000.0 |
| 2015-03-24 | 2091.5      | 3189820000.0 |
+------------+-------------+--------------+
```
