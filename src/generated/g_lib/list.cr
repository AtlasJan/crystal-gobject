module GLib
  class List
    include GObject::WrappedType

    def self.new(data : Void*|Nil = nil, next next_ : Void*|Nil = nil, prev : Void*|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(24, 0u8)
      new(ptr.as(LibGLib::List*)).tap do |object|
        object.data = data unless data.nil?
        object.next = next_ unless next_.nil?
        object.prev = prev unless prev.nil?
      end
    end

    @g_lib_list : LibGLib::List*?
    def initialize(@g_lib_list : LibGLib::List*)
    end

    def to_unsafe
      @g_lib_list.not_nil!.as(Void*)
    end

    def data
      (to_unsafe.as(LibGLib::List*).value.data)
    end

    def data=(value : Void*)
      to_unsafe.as(LibGLib::List*).value.data = value
    end

    def next
      (to_unsafe.as(LibGLib::List*).value.next_)
    end

    def next=(value : Void*)
      to_unsafe.as(LibGLib::List*).value.next_ = value
    end

    def prev
      (to_unsafe.as(LibGLib::List*).value.prev)
    end

    def prev=(value : Void*)
      to_unsafe.as(LibGLib::List*).value.prev = value
    end

  end
end

