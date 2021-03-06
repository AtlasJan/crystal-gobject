require "./i_o_stream"

module Gio
  class SocketConnection < IOStream
    @pointer : Void*
    def initialize(pointer : LibGio::SocketConnection*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGio::SocketConnection*)
    end

    def socket
      gvalue = GObject::Value.new(GObject::Type::INTERFACE)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "socket", gvalue)
      Gio::Socket.cast(gvalue.object)
    end

    def self.factory_lookup_type(family : Gio::SocketFamily, type : Gio::SocketType, protocol_id)
      __return_value = LibGio.socket_connection_factory_lookup_type(family, type, Int32.new(protocol_id))
      __return_value
    end

    def self.factory_register_type(g_type, family : Gio::SocketFamily, type : Gio::SocketType, protocol)
      LibGio.socket_connection_factory_register_type(UInt64.new(g_type), family, type, Int32.new(protocol))
      nil
    end

    def connect(address, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.socket_connection_connect(@pointer.as(LibGio::SocketConnection*), address.to_unsafe.as(LibGio::SocketAddress*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def connect_async(address, cancellable, callback, user_data)
      LibGio.socket_connection_connect_async(@pointer.as(LibGio::SocketConnection*), address.to_unsafe.as(LibGio::SocketAddress*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      nil
    end

    def connect_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.socket_connection_connect_finish(@pointer.as(LibGio::SocketConnection*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def local_address
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.socket_connection_get_local_address(@pointer.as(LibGio::SocketConnection*), pointerof(__error))
      GLib::Error.assert __error
      Gio::SocketAddress.new(__return_value)
    end

    def remote_address
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.socket_connection_get_remote_address(@pointer.as(LibGio::SocketConnection*), pointerof(__error))
      GLib::Error.assert __error
      Gio::SocketAddress.new(__return_value)
    end

    def socket
      __return_value = LibGio.socket_connection_get_socket(@pointer.as(LibGio::SocketConnection*))
      Gio::Socket.new(__return_value)
    end

    def connected?
      __return_value = LibGio.socket_connection_is_connected(@pointer.as(LibGio::SocketConnection*))
      __return_value
    end

  end
end

