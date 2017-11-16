module Gio
  class DBusArgInfo
    include GObject::WrappedType

    def self.new(ref_count : Int32|Nil = nil, name : String|Nil = nil, signature : String|Nil = nil, annotations : Array(Gio::DBusAnnotationInfo)|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(32, 0u8)
      new(ptr.as(LibGio::DBusArgInfo*)).tap do |object|
        object.ref_count = ref_count unless ref_count.nil?
        object.name = name unless name.nil?
        object.signature = signature unless signature.nil?
        object.annotations = annotations unless annotations.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGio::DBusArgInfo*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGio::DBusArgInfo*)
    end

    def ref
      __return_value = LibGio.d_bus_arg_info_ref(@pointer.as(LibGio::DBusArgInfo*))
      Gio::DBusArgInfo.new(__return_value)
    end

    def unref
      LibGio.d_bus_arg_info_unref(@pointer.as(LibGio::DBusArgInfo*))
      nil
    end

    def ref_count
      (to_unsafe.as(LibGio::DBusArgInfo*).value.ref_count)
    end

    def ref_count=(value : Int32)
      to_unsafe.as(LibGio::DBusArgInfo*).value.ref_count = Int32.new(value)
    end

    def name
      (raise "Expected string but got null" unless (to_unsafe.as(LibGio::DBusArgInfo*).value.name); ::String.new((to_unsafe.as(LibGio::DBusArgInfo*).value.name)))
    end

    def name=(value : String)
      to_unsafe.as(LibGio::DBusArgInfo*).value.name = value.to_unsafe
    end

    def signature
      (raise "Expected string but got null" unless (to_unsafe.as(LibGio::DBusArgInfo*).value.signature); ::String.new((to_unsafe.as(LibGio::DBusArgInfo*).value.signature)))
    end

    def signature=(value : String)
      to_unsafe.as(LibGio::DBusArgInfo*).value.signature = value.to_unsafe
    end

    def annotations
      PointerIterator.new((to_unsafe.as(LibGio::DBusArgInfo*).value.annotations)) {|__item| Gio::DBusAnnotationInfo.new(__item) }
    end

    def annotations=(value : Array(Gio::DBusAnnotationInfo))
      to_unsafe.as(LibGio::DBusArgInfo*).value.annotations = value
    end

  end
end

