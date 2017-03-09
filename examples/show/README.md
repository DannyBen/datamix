# show

Print the entire table, or a specified number of rows.

```ruby
require 'datamix'
using DataMix

data = file '../_data/basic.csv'
data.show 3

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
