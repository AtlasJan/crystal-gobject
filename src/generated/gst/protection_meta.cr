module Gst
  class ProtectionMeta
    include GObject::WrappedType

    def self.new(meta : Gst::Meta|Nil = nil, info : Gst::Structure|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(24, 0u8)
      new(ptr.as(LibGst::ProtectionMeta*)).tap do |object|
        object.meta = meta unless meta.nil?
        object.info = info unless info.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGst::ProtectionMeta*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGst::ProtectionMeta*)
    end

    def self.info
      __return_value = LibGst.protection_meta_get_info
      Gst::MetaInfo.new(__return_value)
    end

    def meta
      Gst::Meta.new((to_unsafe.as(LibGst::ProtectionMeta*).value.meta))
    end

    def meta=(value : Gst::Meta)
      to_unsafe.as(LibGst::ProtectionMeta*).value.meta = value
    end

    def info
      Gst::Structure.new((to_unsafe.as(LibGst::ProtectionMeta*).value.info))
    end

    def info=(value : Gst::Structure)
      to_unsafe.as(LibGst::ProtectionMeta*).value.info = value.to_unsafe.as(LibGst::Structure*)
    end

  end
end

