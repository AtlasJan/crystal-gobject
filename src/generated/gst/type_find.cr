module Gst
  class TypeFind
    include GObject::WrappedType

    def self.new(data : Void*|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(64, 0u8)
      new(ptr.as(LibGst::TypeFind*)).tap do |object|
        object.data = data unless data.nil?
      end
    end

    @gst_type_find : LibGst::TypeFind*?
    def initialize(@gst_type_find : LibGst::TypeFind*)
    end

    def to_unsafe
      @gst_type_find.not_nil!
    end

    def length
      __return_value = LibGst.type_find_get_length(to_unsafe.as(LibGst::TypeFind*))
      __return_value
    end

    def peek(offset, size)
      __return_value = LibGst.type_find_peek(to_unsafe.as(LibGst::TypeFind*), Int64.new(offset), size)
      PointerIterator.new(__return_value) {|__item| __item } if __return_value
    end

    def suggest(probability, caps)
      LibGst.type_find_suggest(to_unsafe.as(LibGst::TypeFind*), UInt32.new(probability), caps.to_unsafe.as(LibGst::Caps*))
      nil
    end

    def self.register(plugin, name, rank, func, extensions, possible_caps, data, data_notify)
      __return_value = LibGst.type_find_register(plugin ? plugin.to_unsafe.as(LibGst::Plugin*) : nil, name.to_unsafe, UInt32.new(rank), func, extensions ? extensions.to_unsafe : nil, possible_caps.to_unsafe.as(LibGst::Caps*), data ? data : nil, data_notify)
      __return_value
    end

    def peek
      (to_unsafe.as(LibGst::TypeFind*).value.peek)
    end

    def suggest
      (to_unsafe.as(LibGst::TypeFind*).value.suggest)
    end

    def data
      (to_unsafe.as(LibGst::TypeFind*).value.data)
    end

    def data=(value : Void*)
      to_unsafe.as(LibGst::TypeFind*).value.data = value
    end

    def get_length
      (to_unsafe.as(LibGst::TypeFind*).value.get_length)
    end

    def _gst_reserved
      PointerIterator.new((to_unsafe.as(LibGst::TypeFind*).value._gst_reserved)) {|__item| __item }
    end

  end
end

