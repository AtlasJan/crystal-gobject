module Gdk
  class Point
    include GObject::WrappedType

    def self.new(x : Int32|Nil = nil, y : Int32|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(8, 0u8)
      new(ptr.as(LibGdk::Point*)).tap do |object|
        object.x = x unless x.nil?
        object.y = y unless y.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGdk::Point*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Point*)
    end

    def x
      (to_unsafe.as(LibGdk::Point*).value.x)
    end

    def x=(value : Int32)
      to_unsafe.as(LibGdk::Point*).value.x = Int32.new(value)
    end

    def y
      (to_unsafe.as(LibGdk::Point*).value.y)
    end

    def y=(value : Int32)
      to_unsafe.as(LibGdk::Point*).value.y = Int32.new(value)
    end

  end
end

