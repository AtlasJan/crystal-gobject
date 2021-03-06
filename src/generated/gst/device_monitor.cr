require "./object"

module Gst
  class DeviceMonitor < Object
    @pointer : Void*
    def initialize(pointer : LibGst::DeviceMonitor*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGst::DeviceMonitor*)
    end

    def show_all
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show_all", gvalue)
      gvalue.boolean
    end

    def self.new : self
      __return_value = LibGst.device_monitor_new
      cast Gst::DeviceMonitor.new(__return_value)
    end

    def add_filter(classes, caps)
      __return_value = LibGst.device_monitor_add_filter(@pointer.as(LibGst::DeviceMonitor*), classes ? classes.to_unsafe : nil, caps ? caps.to_unsafe.as(LibGst::Caps*) : nil)
      __return_value
    end

    def bus
      __return_value = LibGst.device_monitor_get_bus(@pointer.as(LibGst::DeviceMonitor*))
      Gst::Bus.new(__return_value)
    end

    def devices
      __return_value = LibGst.device_monitor_get_devices(@pointer.as(LibGst::DeviceMonitor*))
      GLib::ListIterator(Gst::Device, LibGst::Device**).new(GLib::SList.new(__return_value.as(LibGLib::List*))) if __return_value
    end

    def providers
      __return_value = LibGst.device_monitor_get_providers(@pointer.as(LibGst::DeviceMonitor*))
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) }
    end

    def show_all_devices
      __return_value = LibGst.device_monitor_get_show_all_devices(@pointer.as(LibGst::DeviceMonitor*))
      __return_value
    end

    def remove_filter(filter_id)
      __return_value = LibGst.device_monitor_remove_filter(@pointer.as(LibGst::DeviceMonitor*), UInt32.new(filter_id))
      __return_value
    end

    def show_all_devices=(show_all)
      LibGst.device_monitor_set_show_all_devices(@pointer.as(LibGst::DeviceMonitor*), show_all)
      nil
    end

    def start
      __return_value = LibGst.device_monitor_start(@pointer.as(LibGst::DeviceMonitor*))
      __return_value
    end

    def stop
      LibGst.device_monitor_stop(@pointer.as(LibGst::DeviceMonitor*))
      nil
    end

  end
end

