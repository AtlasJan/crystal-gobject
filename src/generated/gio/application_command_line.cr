module Gio
  class ApplicationCommandLine < GObject::Object
    @pointer : Void*
    def initialize(pointer : LibGio::ApplicationCommandLine*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGio::ApplicationCommandLine*)
    end


    def is_remote
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "is_remote", gvalue)
      gvalue.boolean
    end



    def create_file_for_arg(arg)
      __return_value = LibGio.application_command_line_create_file_for_arg(@pointer.as(LibGio::ApplicationCommandLine*), arg.to_unsafe)
      __return_value
    end

    def arguments(argc)
      __return_value = LibGio.application_command_line_get_arguments(@pointer.as(LibGio::ApplicationCommandLine*), argc)
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) }
    end

    def cwd
      __return_value = LibGio.application_command_line_get_cwd(@pointer.as(LibGio::ApplicationCommandLine*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def environ
      __return_value = LibGio.application_command_line_get_environ(@pointer.as(LibGio::ApplicationCommandLine*))
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) }
    end

    def exit_status
      __return_value = LibGio.application_command_line_get_exit_status(@pointer.as(LibGio::ApplicationCommandLine*))
      __return_value
    end

    def is_remote
      __return_value = LibGio.application_command_line_get_is_remote(@pointer.as(LibGio::ApplicationCommandLine*))
      __return_value
    end

    def options_dict
      __return_value = LibGio.application_command_line_get_options_dict(@pointer.as(LibGio::ApplicationCommandLine*))
      GLib::VariantDict.new(__return_value)
    end

    def platform_data
      __return_value = LibGio.application_command_line_get_platform_data(@pointer.as(LibGio::ApplicationCommandLine*))
      GLib::Variant.new(__return_value) if __return_value
    end

    def stdin
      __return_value = LibGio.application_command_line_get_stdin(@pointer.as(LibGio::ApplicationCommandLine*))
      Gio::InputStream.new(__return_value)
    end

    def getenv(name)
      __return_value = LibGio.application_command_line_getenv(@pointer.as(LibGio::ApplicationCommandLine*), name.to_unsafe)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def exit_status=(exit_status)
      LibGio.application_command_line_set_exit_status(@pointer.as(LibGio::ApplicationCommandLine*), Int32.new(exit_status))
      nil
    end

  end
end

