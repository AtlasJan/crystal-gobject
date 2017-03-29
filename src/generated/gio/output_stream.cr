module Gio
  class OutputStream < GObject::Object
    @gio_output_stream : LibGio::OutputStream*?
    def initialize(@gio_output_stream : LibGio::OutputStream*)
    end

    def to_unsafe
      @gio_output_stream.not_nil!
    end

    def clear_pending
      __return_value = LibGio.output_stream_clear_pending(to_unsafe.as(LibGio::OutputStream*))
      __return_value
    end

    def close(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_close(to_unsafe.as(LibGio::OutputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def close_async(io_priority, cancellable, callback, user_data)
      __return_value = LibGio.output_stream_close_async(to_unsafe.as(LibGio::OutputStream*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def close_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_close_finish(to_unsafe.as(LibGio::OutputStream*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def flush(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_flush(to_unsafe.as(LibGio::OutputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def flush_async(io_priority, cancellable, callback, user_data)
      __return_value = LibGio.output_stream_flush_async(to_unsafe.as(LibGio::OutputStream*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def flush_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_flush_finish(to_unsafe.as(LibGio::OutputStream*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def has_pending
      __return_value = LibGio.output_stream_has_pending(to_unsafe.as(LibGio::OutputStream*))
      __return_value
    end

    def closed?
      __return_value = LibGio.output_stream_is_closed(to_unsafe.as(LibGio::OutputStream*))
      __return_value
    end

    def closing?
      __return_value = LibGio.output_stream_is_closing(to_unsafe.as(LibGio::OutputStream*))
      __return_value
    end

    def pending=
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_set_pending(to_unsafe.as(LibGio::OutputStream*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def splice(source, flags : Gio::OutputStreamSpliceFlags, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_splice(to_unsafe.as(LibGio::OutputStream*), source.to_unsafe.as(LibGio::InputStream*), flags, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def splice_async(source, flags : Gio::OutputStreamSpliceFlags, io_priority, cancellable, callback, user_data)
      __return_value = LibGio.output_stream_splice_async(to_unsafe.as(LibGio::OutputStream*), source.to_unsafe.as(LibGio::InputStream*), flags, Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def splice_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_splice_finish(to_unsafe.as(LibGio::OutputStream*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def write(buffer, count, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_write(to_unsafe.as(LibGio::OutputStream*), buffer, UInt64.new(count), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def write_all(buffer, count, bytes_written, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_write_all(to_unsafe.as(LibGio::OutputStream*), buffer, UInt64.new(count), bytes_written, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def write_all_async(buffer, count, io_priority, cancellable, callback, user_data)
      __return_value = LibGio.output_stream_write_all_async(to_unsafe.as(LibGio::OutputStream*), buffer, UInt64.new(count), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def write_all_finish(result, bytes_written)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_write_all_finish(to_unsafe.as(LibGio::OutputStream*), result.to_unsafe.as(LibGio::AsyncResult*), bytes_written, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def write_async(buffer, count, io_priority, cancellable, callback, user_data)
      __return_value = LibGio.output_stream_write_async(to_unsafe.as(LibGio::OutputStream*), buffer, UInt64.new(count), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def write_bytes(bytes, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_write_bytes(to_unsafe.as(LibGio::OutputStream*), bytes.to_unsafe.as(LibGLib::Bytes*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def write_bytes_async(bytes, io_priority, cancellable, callback, user_data)
      __return_value = LibGio.output_stream_write_bytes_async(to_unsafe.as(LibGio::OutputStream*), bytes.to_unsafe.as(LibGLib::Bytes*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def write_bytes_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_write_bytes_finish(to_unsafe.as(LibGio::OutputStream*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def write_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.output_stream_write_finish(to_unsafe.as(LibGio::OutputStream*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

  end
end

