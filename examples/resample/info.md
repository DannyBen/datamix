Resample a single column or an entire table.

This method creates a new series that is similar to the original. It 
will slice the series to several random parts, shufle and glue them 
together in such a way that the result resembles the original series.

When calling this method, pass in a range to determine the minimum and 
maximum size of each slice.

When resampling a table, the series will remain in sync.