module Gio
  class InetAddressMask < GObject::Object
    @gio_inet_address_mask : LibGio::InetAddressMask*?
    def initialize(@gio_inet_address_mask : LibGio::InetAddressMask*)
    end

    def to_unsafe
      @gio_inet_address_mask.not_nil!
    end

    # Implements Initable



    def self.new(addr, length) : self
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.inet_address_mask_new(addr.to_unsafe.as(LibGio::InetAddress*), UInt32.new(length), pointerof(__error))
      GLib::Error.assert __error
      cast Gio::InetAddressMask.new(__return_value)
    end

    def self.new_from_string(mask_string) : self
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.inet_address_mask_new_from_string(mask_string.to_unsafe, pointerof(__error))
      GLib::Error.assert __error
      cast Gio::InetAddressMask.new(__return_value)
    end

    def equal(mask2)
      __return_value = LibGio.inet_address_mask_equal(to_unsafe.as(LibGio::InetAddressMask*), mask2.to_unsafe.as(LibGio::InetAddressMask*))
      __return_value
    end

    def address
      __return_value = LibGio.inet_address_mask_get_address(to_unsafe.as(LibGio::InetAddressMask*))
      Gio::InetAddress.new(__return_value)
    end

    def family
      __return_value = LibGio.inet_address_mask_get_family(to_unsafe.as(LibGio::InetAddressMask*))
      __return_value
    end

    def length
      __return_value = LibGio.inet_address_mask_get_length(to_unsafe.as(LibGio::InetAddressMask*))
      __return_value
    end

    def matches(address)
      __return_value = LibGio.inet_address_mask_matches(to_unsafe.as(LibGio::InetAddressMask*), address.to_unsafe.as(LibGio::InetAddress*))
      __return_value
    end

    def to_string
      __return_value = LibGio.inet_address_mask_to_string(to_unsafe.as(LibGio::InetAddressMask*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

  end
end

