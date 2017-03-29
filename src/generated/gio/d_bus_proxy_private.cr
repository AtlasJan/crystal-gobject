module Gio
  class DBusProxyPrivate
    include GObject::WrappedType

    @gio_d_bus_proxy_private : LibGio::DBusProxyPrivate*?
    def initialize(@gio_d_bus_proxy_private : LibGio::DBusProxyPrivate*)
    end

    def to_unsafe
      @gio_d_bus_proxy_private.not_nil!
    end

  end
end

