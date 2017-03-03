module DataMix
  refine Array do
    def -(other)
      if other.respond_to? :each
        each_with_index do |val, index|
          self[index] = other[index] ? val - other[index] : nil
        end
      else
        map { |val| val - other }
      end
    end

    def +(other)
      if other.respond_to? :each
        each_with_index do |val, index|
          self[index] = other[index] ? val + other[index] : nil
        end
      else
        map { |val| val + other }
      end
    end

    def *(other)
      if other.respond_to? :each
        each_with_index do |val, index|
          self[index] = other[index] ? val * other[index] : nil
        end
      else
        map { |val| val * other }
      end
    end

    def /(other)
      if other.respond_to? :each
        each_with_index do |val, index|
          self[index] = other[index] ? val / other[index].to_f : nil
        end
      else
        map { |val| val / other.to_f }
      end
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

  end
end