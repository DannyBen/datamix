# to_ascii

Returns the entire table or a specified number of rows as a string.

```ruby
require 'datamix'
using DataMix

data = file '../_data/basic.csv'
puts data.to_ascii 3

```

# Output

```
+------------+-------+
| date       | price |
+------------+-------+
| 2015-03-11 | 2044  |
| 2015-03-12 | 2041  |
| 2015-03-13 | 2064  |
+------------+-------+
```
