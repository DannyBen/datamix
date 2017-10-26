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
        dup[(rows.abs)...(self.size)].concat Array.new(padding)
      end
    end

    def prev(rows=1)
      offset rows
    end

    def next(rows=1)
      offset -rows
    end

    def resample(chunk_range, seed: nil)
      generator = seed ? Random.new(seed) : Random.new

      # Save min value, we will adjust the result to it later
      min_value = min

      # Split the array to chunks
      chunks = []
      clone = dup
      while !clone.empty? do
        seam = generator.rand(chunk_range) - 1
        chunks.push clone.slice! 0..seam
      end

      # If the last chunk contains one element only, merge with the 
      # previous chunk
      if chunks.last.size == 1
        chunks[chunks.size-2].push chunks.last.first
        chunks = chunks.first chunks.size-1
      end

      # Shuffle the chunks
      chunks = chunks.sample chunks.size, random: generator

      # Adjust each chunk so that its beginning connects with the previous
      # chunk normally. For this we calculate the median change value of the 
      # array.
      chunks.each_with_index do |chunk, i|
        next if i == 0
        connector = chunks[i-1].last

        # Calculate an array of changes, and then take a random sample
        diff = chunk.each_cons(2).map { |a,b| b-a }.sample random: generator

        delta = diff + connector - chunk.first
        chunks[i].map! { |val| val+delta }
      end

      # Merge chunks to a flat array
      result = chunks.flatten

      # Move the entire array up or down so that its min value is equal to 
      # the original min value recorded at the beginning.
      diff = result.min - min_value
      result.map! { |val| val-diff }
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
      copy = dup
      if other.respond_to? :each
        each_with_index do |val, index|
          copy[index] = other[index] ? yield(val, other[index]) : nil
        end
      else
        copy.map { |val| yield(val, other) }
      end
      copy
    end

  end
end
