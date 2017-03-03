DataMix - DSL for manipulating tabular data
==================================================

[![Gem](https://img.shields.io/gem/v/datamix.svg?style=flat-square)](https://rubygems.org/gems/datamix)
[![Travis](https://img.shields.io/travis/DannyBen/datamix.svg?style=flat-square)](https://travis-ci.org/DannyBen/datamix)
[![Code Climate](https://img.shields.io/codeclimate/github/DannyBen/datamix.svg?style=flat-square)](https://codeclimate.com/github/DannyBen/datamix)
[![Gemnasium](https://img.shields.io/gemnasium/DannyBen/datamix.svg?style=flat-square)](https://gemnasium.com/DannyBen/datamix)

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



Usage
--------------------------------------------------

Require the library and enable the refinements with `using DataMix`:

```ruby
require 'datamix'
using DataMix
```

TODO: Complete documentation.


[1]: https://ruby-doc.org/stdlib-2.3.1/libdoc/csv/rdoc/CSV/Table.html
