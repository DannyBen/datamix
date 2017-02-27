module DataMix
  refine NilClass do
    def *(other); nil end
    def +(other); nil end
    def -(other); nil end
    def /(other); nil end
  end
end