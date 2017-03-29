require 'terminal-table'

module DataMix
  refine CSV::Table do
    
    # Delete all rows that have one or more empty or nil values.
    def delete_empty_rows
      delete_if do |row|
        row.fields.include? nil or row.include? ''
      end
    end

    # Create a new column using a block. This method yields the given block 
    # row by row, providing the index to the block and returns an array
    # suitable for assigning to a new column.
    def derive(&_block)
      by_row.each_with_index.map do |_value, index|
        yield index
      end
    end

    # Extract a regular expression pattern from a column and return a new
    # column.
    def extract(pattern, from:)
      by_row.map { |row| row[from][pattern] }
    end

    # Iterate over all rows, providing the index to the block.
    def iterate(&_block)
      each_with_index do |_value, index|
        yield index
      end
    end

    # Join columns from another data table based on a mutual column
    def join(other, on:)
      raise CSVError, "No such column '#{on}' in source" unless headers.include? on
      raise CSVError, "No such column '#{on}' in other" unless other.headers.include? on
      raise CSVError, "source[#{on}] is not unique" unless by_col[on].uniq?
      raise CSVError, "other[#{on}] is not unique" unless other.by_col[on].uniq?

      original_headers = headers.dup

      by_row.each do |row|
        other_row = other.find { |r| r[on] == row[on] }
        other.headers.each do |col|
          next if col == on
          new_col = original_headers.include?(col) ? "_#{col}" : col
          row[new_col] = other_row ? other_row[col] : nil
        end
      end
    end

    # Keep one or more columns, and remove the rest
    def keep(*desired_cols)
      headers.each do |col|
        delete col unless desired_cols.include? col
      end
    end

    # Print the first 10 lines
    def preview
      show 10
    end

    # Remove one or more columns
    def remove(*desired_cols)
      desired_cols.each do |col|
        delete col
      end
    end

    # Rename a column
    def rename(from, to:)
      by_col[to] = by_col[from]
      delete from
    end

    # Create a similar data table with resampled data
    def resample(range, except: [], seed: nil)
      except = [except] unless except.is_a? Array
      cols = headers.reject { |h| except.include? h }
      seed ||= Time.now.to_f

      cols.each do |col|
        by_col[col] = by_col[col].resample range, seed: seed
      end
    end

    # Rounds all values in a column
    def round(col, decimals: 0)
      by_col[col] = by_col[col].map { |val| val ? val.round(decimals) : nil }
    end
    
    # Save to a CSV or TSV file
    def save_as(filename)
      ext = File.extname(filename).downcase
      data = ext == '.csv' ? to_s : to_tsv
      File.write filename, data
    end

    # Print some or all rows
    def show(rows=:all)
      puts to_ascii rows
    end

    # Returns a table string
    def to_ascii(rows=:all)
      table = rows == :all ? by_row : first(rows)
      rows = table.map { |row| row.fields }
      Terminal::Table.new(headings: headers, rows: rows).to_s
    end

    # Convert table to a TSV string
    def to_tsv
      result = [headers.join( "\t")]
      self.each do |row|
        result << row.fields.join("\t")
      end
      result.join "\n"
    end

  end
end
