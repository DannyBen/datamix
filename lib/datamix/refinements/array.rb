module DataMix
  refine Array do
    def -(other)
      math_operation(other) { |left, right| left - right }
    end

    def +(other)
      math_operation(other) { |left, right| left + right }
    end

    def *(other)
      math_operation(other) { |left, right| left * right }
    end

    def /(other)
      math_operation(other) { |left, right| left / right.to_f }
    end

    def offset(rows)
      padding = Array.new rows.abs
      if rows >= 0
        Array.new(padding).concat self[0...(self.size-rows)]
      else
        self[(rows.abs)...(self.size)].concat Array.new(padding)
      end
    end

    def prev(rows=1)
      offset rows
    end

    def next(rows=1)
      offset -rows
    end

    def round(decimals=0)
      map { |val| val ? val.round(decimals) : nil }
    end

    def uniq?
      self.length == self.uniq.length
    end

    def window(window_size, &_block)
      result = (0..(size-window_size)).map do |index|
        yield self[index...(index+window_size)]
      end

      Array.new(window_size-1).concat result
    end

    private

    def math_operation(other)
      if other.respond_to? :each
        each_with_index do |val, index|
          self[index] = other[index] ? yield(val, other[index]) : nil
        end
      else
        map { |val| yield(val, other) }
      end
    end

  end
end