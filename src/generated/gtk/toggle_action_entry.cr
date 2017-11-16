module Gtk
  class ToggleActionEntry
    include GObject::WrappedType

    def self.new(name : String|Nil = nil, stock_id : String|Nil = nil, label : String|Nil = nil, accelerator : String|Nil = nil, tooltip : String|Nil = nil, callback : GObject::Callback|Nil = nil, is_active : Bool|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(56, 0u8)
      new(ptr.as(LibGtk::ToggleActionEntry*)).tap do |object|
        object.name = name unless name.nil?
        object.stock_id = stock_id unless stock_id.nil?
        object.label = label unless label.nil?
        object.accelerator = accelerator unless accelerator.nil?
        object.tooltip = tooltip unless tooltip.nil?
        object.callback = callback unless callback.nil?
        object.is_active = is_active unless is_active.nil?
      end
    end

    @pointer : Void*
    def initialize(pointer : LibGtk::ToggleActionEntry*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::ToggleActionEntry*)
    end

    def name
      (raise "Expected string but got null" unless (to_unsafe.as(LibGtk::ToggleActionEntry*).value.name); ::String.new((to_unsafe.as(LibGtk::ToggleActionEntry*).value.name)))
    end

    def name=(value : String)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.name = value.to_unsafe
    end

    def stock_id
      (raise "Expected string but got null" unless (to_unsafe.as(LibGtk::ToggleActionEntry*).value.stock_id); ::String.new((to_unsafe.as(LibGtk::ToggleActionEntry*).value.stock_id)))
    end

    def stock_id=(value : String)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.stock_id = value.to_unsafe
    end

    def label
      (raise "Expected string but got null" unless (to_unsafe.as(LibGtk::ToggleActionEntry*).value.label); ::String.new((to_unsafe.as(LibGtk::ToggleActionEntry*).value.label)))
    end

    def label=(value : String)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.label = value.to_unsafe
    end

    def accelerator
      (raise "Expected string but got null" unless (to_unsafe.as(LibGtk::ToggleActionEntry*).value.accelerator); ::String.new((to_unsafe.as(LibGtk::ToggleActionEntry*).value.accelerator)))
    end

    def accelerator=(value : String)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.accelerator = value.to_unsafe
    end

    def tooltip
      (raise "Expected string but got null" unless (to_unsafe.as(LibGtk::ToggleActionEntry*).value.tooltip); ::String.new((to_unsafe.as(LibGtk::ToggleActionEntry*).value.tooltip)))
    end

    def tooltip=(value : String)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.tooltip = value.to_unsafe
    end

    def callback
      (to_unsafe.as(LibGtk::ToggleActionEntry*).value.callback)
    end

    def callback=(value : GObject::Callback)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.callback = value
    end

    def is_active
      (to_unsafe.as(LibGtk::ToggleActionEntry*).value.is_active)
    end

    def is_active=(value : Bool)
      to_unsafe.as(LibGtk::ToggleActionEntry*).value.is_active = value
    end

  end
end

