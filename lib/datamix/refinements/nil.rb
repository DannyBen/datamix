module DataMix
  refine NilClass do
    def *(_other); nil end
    def +(_other); nil end
    def -(_other); nil end
    def /(_other); nil end
  end
end