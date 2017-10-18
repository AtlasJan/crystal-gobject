module Gio
  class IOStream < GObject::Object
    @gio_i_o_stream : LibGio::IOStream*?
    def initialize(@gio_i_o_stream : LibGio::IOStream*)
    end

    def to_unsafe
      @gio_i_o_stream.not_nil!
    end

    def closed
      __return_value = LibGio.i_o_stream_get_closed(to_unsafe.as(LibGio::IOStream*))
      __return_value
    end

    def input_stream
      __return_value = LibGio.i_o_stream_get_input_stream(to_unsafe.as(LibGio::IOStream*))
      Gio::InputStream.new(__return_value)
    end

    def output_stream
      __return_value = LibGio.i_o_stream_get_output_stream(to_unsafe.as(LibGio::IOStream*))
      Gio::OutputStream.new(__return_value)
    end

    def self.splice_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.i_o_stream_splice_finish(result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def clear_pending
      LibGio.i_o_stream_clear_pending(to_unsafe.as(LibGio::IOStream*))
      nil
    end

    def close(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.i_o_stream_close(to_unsafe.as(LibGio::IOStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def close_async(io_priority, cancellable, callback, user_data)
      LibGio.i_o_stream_close_async(to_unsafe.as(LibGio::IOStream*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      nil
    end

    def close_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.i_o_stream_close_finish(to_unsafe.as(LibGio::IOStream*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def input_stream
      __return_value = LibGio.i_o_stream_get_input_stream(to_unsafe.as(LibGio::IOStream*))
      Gio::InputStream.new(__return_value)
    end

    def output_stream
      __return_value = LibGio.i_o_stream_get_output_stream(to_unsafe.as(LibGio::IOStream*))
      Gio::OutputStream.new(__return_value)
    end

    def has_pending
      __return_value = LibGio.i_o_stream_has_pending(to_unsafe.as(LibGio::IOStream*))
      __return_value
    end

    def closed?
      __return_value = LibGio.i_o_stream_is_closed(to_unsafe.as(LibGio::IOStream*))
      __return_value
    end

    def pending=
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.i_o_stream_set_pending(to_unsafe.as(LibGio::IOStream*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def splice_async(stream2, flags : Gio::IOStreamSpliceFlags, io_priority, cancellable, callback, user_data)
      LibGio.i_o_stream_splice_async(to_unsafe.as(LibGio::IOStream*), stream2.to_unsafe.as(LibGio::IOStream*), flags, Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      nil
    end

  end
end

