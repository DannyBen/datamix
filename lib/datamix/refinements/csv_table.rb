require 'terminal-table'

module DataMix
  refine CSV::Table do
    
    def delete_empty_rows
      delete_if do |row|
        row.fields.include? nil or row.include? ''
      end
    end

    def derive(&_block)
      by_row.each_with_index.map do |_value, index|
        yield by_row, index
      end
    end

    def drop(*desired_cols)
      desired_cols.each do |col|
        delete col
      end
    end

    def extract(pattern, from:, to: nil)
      to ||= from
      by_row.each do |row|
        row[to] = row[from][pattern]
      end
    end

    def iterate(&_block)
      by_row.each_with_index do |_value, index|
        yield index
      end
    end

    def join(other, on:)
      by_row.each do |row|
        other_row = other.find { |r| r[on] == row[on] }
        other.headers.each do |col|
          next if col == on
          row[col] = other_row ? other_row[col] : nil
        end
      end
    end

    def keep(*desired_cols)
      headers.each do |col|
        delete col unless desired_cols.include? col
      end
    end

    def preview
      show 10
    end

    def rename(source_col, target_col)
      by_col[target_col] = by_col[source_col]
      delete source_col
    end
    
    def save_as(filename)
      ext = File.extname(filename).downcase
      data = ext == '.csv' ? to_s : to_tsv
      File.write filename, data
    end

    def show(rows=:all)
      table = rows == :all ? all : first(rows)
      rows = table.map { |row| row.fields }
      puts Terminal::Table.new headings: headers, rows: rows
    end

    def to_tsv
      result = [headers.join( "\t")]
      self.each do |row|
        result << row.fields.join("\t")
      end
      result.join "\n"
    end

  end
end
