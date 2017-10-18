module Gdk
  class Device < GObject::Object
    @gdk_device : LibGdk::Device*?
    def initialize(@gdk_device : LibGdk::Device*)
    end

    def to_unsafe
      @gdk_device.not_nil!
    end

    def associated_device
      __return_value = LibGdk.device_get_associated_device(to_unsafe.as(LibGdk::Device*))
      Gdk::Device.new(__return_value)
    end

    def axes
      __return_value = LibGdk.device_get_axes(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def device_manager
      __return_value = LibGdk.device_get_device_manager(to_unsafe.as(LibGdk::Device*))
      Gdk::DeviceManager.new(__return_value)
    end

    def display
      __return_value = LibGdk.device_get_display(to_unsafe.as(LibGdk::Device*))
      Gdk::Display.new(__return_value)
    end

    def has_cursor
      __return_value = LibGdk.device_get_has_cursor(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def input_mode
      __return_value = LibGdk.device_get_input_mode(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def input_source
      __return_value = LibGdk.device_get_input_source(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def n_axes
      __return_value = LibGdk.device_get_n_axes(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def name
      __return_value = LibGdk.device_get_name(to_unsafe.as(LibGdk::Device*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def num_touches
      __return_value = LibGdk.device_get_num_touches(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def product_id
      __return_value = LibGdk.device_get_product_id(to_unsafe.as(LibGdk::Device*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def seat
      __return_value = LibGdk.device_get_seat(to_unsafe.as(LibGdk::Device*))
      Gdk::Seat.new(__return_value)
    end

    def tool
      __return_value = LibGdk.device_get_tool(to_unsafe.as(LibGdk::Device*))
      Gdk::DeviceTool.new(__return_value)
    end

    def type
      __return_value = LibGdk.device_get_type(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def vendor_id
      __return_value = LibGdk.device_get_vendor_id(to_unsafe.as(LibGdk::Device*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def self.grab_info_libgtk_only(display, device, grab_window, owner_events)
      __return_value = LibGdk.device_grab_info_libgtk_only(display.to_unsafe.as(LibGdk::Display*), device.to_unsafe.as(LibGdk::Device*), grab_window, owner_events)
      __return_value
    end

    def associated_device
      __return_value = LibGdk.device_get_associated_device(to_unsafe.as(LibGdk::Device*))
      Gdk::Device.new(__return_value) if __return_value
    end

    def axes
      __return_value = LibGdk.device_get_axes(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def axis_use(index)
      __return_value = LibGdk.device_get_axis_use(to_unsafe.as(LibGdk::Device*), UInt32.new(index))
      __return_value
    end

    def device_type
      __return_value = LibGdk.device_get_device_type(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def display
      __return_value = LibGdk.device_get_display(to_unsafe.as(LibGdk::Device*))
      Gdk::Display.new(__return_value)
    end

    def has_cursor
      __return_value = LibGdk.device_get_has_cursor(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def key(index, keyval, modifiers : Gdk::ModifierType)
      __return_value = LibGdk.device_get_key(to_unsafe.as(LibGdk::Device*), UInt32.new(index), keyval, modifiers)
      __return_value
    end

    def last_event_window
      __return_value = LibGdk.device_get_last_event_window(to_unsafe.as(LibGdk::Device*))
      Gdk::Window.new(__return_value) if __return_value
    end

    def mode
      __return_value = LibGdk.device_get_mode(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def n_axes
      __return_value = LibGdk.device_get_n_axes(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def n_keys
      __return_value = LibGdk.device_get_n_keys(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def name
      __return_value = LibGdk.device_get_name(to_unsafe.as(LibGdk::Device*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def position(screen, x, y)
      LibGdk.device_get_position(to_unsafe.as(LibGdk::Device*), screen, x, y)
      nil
    end

    def position_double(screen, x, y)
      LibGdk.device_get_position_double(to_unsafe.as(LibGdk::Device*), screen, x, y)
      nil
    end

    def product_id
      __return_value = LibGdk.device_get_product_id(to_unsafe.as(LibGdk::Device*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def seat
      __return_value = LibGdk.device_get_seat(to_unsafe.as(LibGdk::Device*))
      Gdk::Seat.new(__return_value)
    end

    def source
      __return_value = LibGdk.device_get_source(to_unsafe.as(LibGdk::Device*))
      __return_value
    end

    def vendor_id
      __return_value = LibGdk.device_get_vendor_id(to_unsafe.as(LibGdk::Device*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def window_at_position(win_x, win_y)
      __return_value = LibGdk.device_get_window_at_position(to_unsafe.as(LibGdk::Device*), win_x, win_y)
      Gdk::Window.new(__return_value) if __return_value
    end

    def window_at_position_double(win_x, win_y)
      __return_value = LibGdk.device_get_window_at_position_double(to_unsafe.as(LibGdk::Device*), win_x, win_y)
      Gdk::Window.new(__return_value) if __return_value
    end

    def grab(window, grab_ownership : Gdk::GrabOwnership, owner_events, event_mask : Gdk::EventMask, cursor, time)
      __return_value = LibGdk.device_grab(to_unsafe.as(LibGdk::Device*), window.to_unsafe.as(LibGdk::Window*), grab_ownership, owner_events, event_mask, cursor ? cursor.to_unsafe.as(LibGdk::Cursor*) : nil, UInt32.new(time))
      __return_value
    end

    def list_axes
      __return_value = LibGdk.device_list_axes(to_unsafe.as(LibGdk::Device*))
      GLib::ListIterator(Gdk::Atom, LibGdk::Atom**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def list_slave_devices
      __return_value = LibGdk.device_list_slave_devices(to_unsafe.as(LibGdk::Device*))
      GLib::ListIterator(Gdk::Device, LibGdk::Device*).new(GLib::SList.new(__return_value.as(LibGLib::List*))) if __return_value
    end

    def set_axis_use(index, use : Gdk::AxisUse)
      LibGdk.device_set_axis_use(to_unsafe.as(LibGdk::Device*), UInt32.new(index), use)
      nil
    end

    def set_key(index, keyval, modifiers : Gdk::ModifierType)
      LibGdk.device_set_key(to_unsafe.as(LibGdk::Device*), UInt32.new(index), UInt32.new(keyval), modifiers)
      nil
    end

    def mode=(mode : Gdk::InputMode)
      __return_value = LibGdk.device_set_mode(to_unsafe.as(LibGdk::Device*), mode)
      __return_value
    end

    def ungrab(time)
      LibGdk.device_ungrab(to_unsafe.as(LibGdk::Device*), UInt32.new(time))
      nil
    end

    def warp(screen, x, y)
      LibGdk.device_warp(to_unsafe.as(LibGdk::Device*), screen.to_unsafe.as(LibGdk::Screen*), Int32.new(x), Int32.new(y))
      nil
    end

    alias ChangedSignal = Device ->
    def on_changed(&__block : ChangedSignal)
      __callback = ->(_arg0 : LibGdk::Device*) {
       __return_value = __block.call(Device.new(_arg0))
       __return_value
      }
      connect("changed", __callback)
    end

    alias ToolChangedSignal = Device, Gdk::DeviceTool ->
    def on_tool_changed(&__block : ToolChangedSignal)
      __callback = ->(_arg0 : LibGdk::Device*, _arg1 : LibGdk::LibGdk::DeviceTool*) {
       __return_value = __block.call(Device.new(_arg0), Gdk::DeviceTool.new(_arg1))
       __return_value
      }
      connect("tool-changed", __callback)
    end

  end
end

