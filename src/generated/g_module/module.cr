module GModule
  class Module
    include GObject::WrappedType

    @g_module_module : LibGModule::Module*?
    def initialize(@g_module_module : LibGModule::Module*)
    end

    def to_unsafe
      @g_module_module.not_nil!
    end

    def close
      __return_value = LibGModule.module_close(to_unsafe.as(LibGModule::Module*))
      __return_value
    end

    def make_resident
      LibGModule.module_make_resident(to_unsafe.as(LibGModule::Module*))
      nil
    end

    def name
      __return_value = LibGModule.module_name(to_unsafe.as(LibGModule::Module*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def symbol(symbol_name, symbol)
      __return_value = LibGModule.module_symbol(to_unsafe.as(LibGModule::Module*), symbol_name.to_unsafe, symbol)
      __return_value
    end

    def self.build_path(directory, module_name)
      __return_value = LibGModule.module_build_path(directory ? directory.to_unsafe : nil, module_name.to_unsafe)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def self.error
      __return_value = LibGModule.module_error
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def self.supported
      __return_value = LibGModule.module_supported
      __return_value
    end

  end
end

