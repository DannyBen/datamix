# file

The `file` method is a syntactic sugar around `CSV.table`.

It retusns a `CSV::Table` object.

```ruby
require 'datamix'
using DataMix

sp500 = file '../_data/basic.csv'
sp500.preview

```

# Output

```
+------------+-------+
| date       | price |
+------------+-------+
| 2015-03-11 | 2044  |
| 2015-03-12 | 2041  |
| 2015-03-13 | 2064  |
| 2015-03-16 | 2055  |
| 2015-03-17 | 2080  |
| 2015-03-18 | 2072  |
| 2015-03-19 | 2098  |
| 2015-03-20 | 2090  |
| 2015-03-23 | 2107  |
| 2015-03-24 | 2103  |
+------------+-------+
```
