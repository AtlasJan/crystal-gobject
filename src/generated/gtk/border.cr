module Gtk
  class Border
    include GObject::WrappedType

    def self.new(left : Int16|Nil = nil, right : Int16|Nil = nil, top : Int16|Nil = nil, bottom : Int16|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(8, 0u8)
      new(ptr.as(LibGtk::Border*)).tap do |object|
        object.left = left unless left.nil?
        object.right = right unless right.nil?
        object.top = top unless top.nil?
        object.bottom = bottom unless bottom.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGtk::Border*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::Border*)
    end

    def self.new : self
      __return_value = LibGtk.border_new
      cast Gtk::Border.new(__return_value)
    end

    def copy
      __return_value = LibGtk.border_copy(@pointer.as(LibGtk::Border*))
      Gtk::Border.new(__return_value)
    end

    def free
      LibGtk.border_free(@pointer.as(LibGtk::Border*))
      nil
    end

    def left
      (to_unsafe.as(LibGtk::Border*).value.left)
    end

    def left=(value : Int16)
      to_unsafe.as(LibGtk::Border*).value.left = Int16.new(value)
    end

    def right
      (to_unsafe.as(LibGtk::Border*).value.right)
    end

    def right=(value : Int16)
      to_unsafe.as(LibGtk::Border*).value.right = Int16.new(value)
    end

    def top
      (to_unsafe.as(LibGtk::Border*).value.top)
    end

    def top=(value : Int16)
      to_unsafe.as(LibGtk::Border*).value.top = Int16.new(value)
    end

    def bottom
      (to_unsafe.as(LibGtk::Border*).value.bottom)
    end

    def bottom=(value : Int16)
      to_unsafe.as(LibGtk::Border*).value.bottom = Int16.new(value)
    end

  end
end

