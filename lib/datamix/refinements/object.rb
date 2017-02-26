module DataMix
  refine Object do
    def file(filename)
      CSV.table filename
    end
  end
end