require 'terminal-table'

module DataMix
  refine CSV::Table do
    
    # Delete all rows that have one or more empty or nil values
    def delete_empty_rows
      delete_if do |row|
        row.fields.include? nil or row.include? ''
      end
    end

    def derive(&_block)
      by_row.each_with_index.map do |_value, index|
        yield index
      end
    end

    # Extract a regular expression pattern from a column and return a new
    # column
    def extract(pattern, from:)
      by_row.map { |row| row[from][pattern] }
    end

    def iterate(&_block)
      by_row.each_with_index do |_value, index|
        yield index
      end
    end

    # Join columns from another data table based on a mutual column
    def join(other, on:)
      by_row.each do |row|
        other_row = other.find { |r| r[on] == row[on] }
        other.headers.each do |col|
          next if col == on
          row[col] = other_row ? other_row[col] : nil
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

    def round(col, decimals=0)
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
      table = rows == :all ? by_row : first(rows)
      rows = table.map { |row| row.fields }
      puts Terminal::Table.new headings: headers, rows: rows
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
