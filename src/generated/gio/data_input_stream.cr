require "./buffered_input_stream"

module Gio
  class DataInputStream < BufferedInputStream
    @gio_data_input_stream : LibGio::DataInputStream*?
    def initialize(@gio_data_input_stream : LibGio::DataInputStream*)
    end

    def to_unsafe
      @gio_data_input_stream.not_nil!
    end

    # Implements Seekable
    def byte_order
      __return_value = LibGio.data_input_stream_get_byte_order(to_unsafe.as(LibGio::DataInputStream*))
      __return_value
    end

    def newline_type
      __return_value = LibGio.data_input_stream_get_newline_type(to_unsafe.as(LibGio::DataInputStream*))
      __return_value
    end

    def self.new(base_stream) : self
      __return_value = LibGio.data_input_stream_new(base_stream.to_unsafe.as(LibGio::InputStream*))
      cast Gio::DataInputStream.new(__return_value)
    end

    def byte_order
      __return_value = LibGio.data_input_stream_get_byte_order(to_unsafe.as(LibGio::DataInputStream*))
      __return_value
    end

    def newline_type
      __return_value = LibGio.data_input_stream_get_newline_type(to_unsafe.as(LibGio::DataInputStream*))
      __return_value
    end

    def read_byte(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_byte(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_int16(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_int16(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_int32(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_int32(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_int64(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_int64(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_line(length, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_line(to_unsafe.as(LibGio::DataInputStream*), length, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      PointerIterator.new(__return_value) {|__item| __item } if __return_value
    end

    def read_line_async(io_priority, cancellable, callback, user_data)
      __return_value = LibGio.data_input_stream_read_line_async(to_unsafe.as(LibGio::DataInputStream*), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def read_line_finish(result, length)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_line_finish(to_unsafe.as(LibGio::DataInputStream*), result.to_unsafe.as(LibGio::AsyncResult*), length, pointerof(__error))
      GLib::Error.assert __error
      PointerIterator.new(__return_value) {|__item| __item } if __return_value
    end

    def read_line_finish_utf8(result, length)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_line_finish_utf8(to_unsafe.as(LibGio::DataInputStream*), result.to_unsafe.as(LibGio::AsyncResult*), length, pointerof(__error))
      GLib::Error.assert __error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def read_line_utf8(length, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_line_utf8(to_unsafe.as(LibGio::DataInputStream*), length, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def read_uint16(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_uint16(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_uint32(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_uint32(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_uint64(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_uint64(to_unsafe.as(LibGio::DataInputStream*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def read_until(stop_chars, length, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_until(to_unsafe.as(LibGio::DataInputStream*), stop_chars.to_unsafe, length, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def read_until_async(stop_chars, io_priority, cancellable, callback, user_data)
      __return_value = LibGio.data_input_stream_read_until_async(to_unsafe.as(LibGio::DataInputStream*), stop_chars.to_unsafe, Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def read_until_finish(result, length)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_until_finish(to_unsafe.as(LibGio::DataInputStream*), result.to_unsafe.as(LibGio::AsyncResult*), length, pointerof(__error))
      GLib::Error.assert __error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def read_upto(stop_chars, stop_chars_len, length, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_upto(to_unsafe.as(LibGio::DataInputStream*), stop_chars.to_unsafe, Int64.new(stop_chars_len), length, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def read_upto_async(stop_chars, stop_chars_len, io_priority, cancellable, callback, user_data)
      __return_value = LibGio.data_input_stream_read_upto_async(to_unsafe.as(LibGio::DataInputStream*), stop_chars.to_unsafe, Int64.new(stop_chars_len), Int32.new(io_priority), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      __return_value
    end

    def read_upto_finish(result, length)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.data_input_stream_read_upto_finish(to_unsafe.as(LibGio::DataInputStream*), result.to_unsafe.as(LibGio::AsyncResult*), length, pointerof(__error))
      GLib::Error.assert __error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def byte_order=(order : Gio::DataStreamByteOrder)
      __return_value = LibGio.data_input_stream_set_byte_order(to_unsafe.as(LibGio::DataInputStream*), order)
      __return_value
    end

    def newline_type=(type : Gio::DataStreamNewlineType)
      __return_value = LibGio.data_input_stream_set_newline_type(to_unsafe.as(LibGio::DataInputStream*), type)
      __return_value
    end

  end
end

