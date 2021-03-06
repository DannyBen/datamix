DataMix - DSL for manipulating tabular data
==================================================

[![Gem Version](https://badge.fury.io/rb/datamix.svg)](https://badge.fury.io/rb/datamix)
[![Build Status](https://github.com/DannyBen/datamix/workflows/Test/badge.svg)](https://github.com/DannyBen/datamix/actions?query=workflow%3ATest)
[![Maintainability](https://api.codeclimate.com/v1/badges/7af46250a35a02dfa0d4/maintainability)](https://codeclimate.com/github/DannyBen/datamix/maintainability)

---

This library refines Ruby's [`CSV::Table`][1] and `Array` objects to provide 
a DSL for manipulating tabular data.

---


Install
--------------------------------------------------

```
$ gem install datamix
```

Or with bundler:

```ruby
gem 'datamix'
```



Example Usage
--------------------------------------------------

```ruby
require 'datamix'
using DataMix

# Load data (this is a shortcut to load a CSV::Table object)
sp500 = file 'sp500.csv'
vix   = file 'vix.csv'

# Keep only desired columns, rename and round data
sp500.keep :date, :adjusted_close
sp500.rename :adjusted_close, to: :close
sp500.round :close, decimals: 2

# Calculate a Change column, based on the Close column and round
sp500[:change] = sp500[:close] - sp500[:close].prev
sp500.round :change, decimals: 2

# Keep only desired columns and rename
vix.keep :date, :adjusted_close
vix.rename :adjusted_close, to: :vix

# Join the two tables
sp500.join vix, on: :date

# Remove all rows that have any empty value
sp500.delete_empty_rows

# Save and preview
sp500.save_as 'output.csv'
sp500.preview

# Output
# +------------+---------+--------+-------+
# | date       | close   | change | vix   |
# +------------+---------+--------+-------+
# | 2015-03-12 | 2065.95 | 25.71  | 15.42 |
# | 2015-03-13 | 2053.4  | -12.55 | 16.0  |
# | 2015-03-16 | 2081.19 | 27.79  | 15.61 |
# | 2015-03-17 | 2074.28 | -6.91  | 15.66 |
# | 2015-03-18 | 2099.5  | 25.22  | 13.97 |
# | 2015-03-19 | 2089.27 | -10.23 | 14.07 |
# | 2015-03-20 | 2108.1  | 18.83  | 13.02 |
# | 2015-03-23 | 2104.42 | -3.68  | 13.41 |
# | 2015-03-24 | 2091.5  | -12.92 | 13.62 |
# | 2015-03-25 | 2061.05 | -30.45 | 15.44 |
# +------------+---------+--------+-------+
```

Examples
--------------------------------------------------

See the [examples index][2] for more examples.

[1]: https://ruby-doc.org/stdlib-2.3.1/libdoc/csv/rdoc/CSV/Table.html
[2]: https://github.com/DannyBen/datamix/tree/master/examples#examples-index
