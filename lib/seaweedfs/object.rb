require 'ostruct'

module Seaweedfs
  class Object < OpenStruct
    def initialize(attributes)
      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map{|k,v| [k, to_ostruct(v)]}.to_h)
      elsif obj.is_a?(Array)
        obj.map{|o| to_ostruct(o)}
      else # Assumed to be a primitive value
        obj
      end
    end
  end
end
