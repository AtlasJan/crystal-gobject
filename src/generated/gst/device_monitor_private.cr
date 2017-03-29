module Gst
  class DeviceMonitorPrivate
    include GObject::WrappedType

    @gst_device_monitor_private : LibGst::DeviceMonitorPrivate*?
    def initialize(@gst_device_monitor_private : LibGst::DeviceMonitorPrivate*)
    end

    def to_unsafe
      @gst_device_monitor_private.not_nil!
    end

  end
end

