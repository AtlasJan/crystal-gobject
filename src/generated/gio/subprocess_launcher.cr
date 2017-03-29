module Gio
  class SubprocessLauncher < GObject::Object
    @gio_subprocess_launcher : LibGio::SubprocessLauncher*?
    def initialize(@gio_subprocess_launcher : LibGio::SubprocessLauncher*)
    end

    def to_unsafe
      @gio_subprocess_launcher.not_nil!
    end


    def self.new(flags : Gio::SubprocessFlags) : self
      __return_value = LibGio.subprocess_launcher_new(flags)
      cast Gio::SubprocessLauncher.new(__return_value)
    end

    def getenv(variable)
      __return_value = LibGio.subprocess_launcher_getenv(to_unsafe.as(LibGio::SubprocessLauncher*), variable.to_unsafe)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def set_child_setup(child_setup, user_data, destroy_notify)
      __return_value = LibGio.subprocess_launcher_set_child_setup(to_unsafe.as(LibGio::SubprocessLauncher*), child_setup, user_data ? user_data : nil, destroy_notify)
      __return_value
    end

    def cwd=(cwd)
      __return_value = LibGio.subprocess_launcher_set_cwd(to_unsafe.as(LibGio::SubprocessLauncher*), cwd.to_unsafe)
      __return_value
    end

    def environ=(env)
      __return_value = LibGio.subprocess_launcher_set_environ(to_unsafe.as(LibGio::SubprocessLauncher*), env)
      __return_value
    end

    def flags=(flags : Gio::SubprocessFlags)
      __return_value = LibGio.subprocess_launcher_set_flags(to_unsafe.as(LibGio::SubprocessLauncher*), flags)
      __return_value
    end

    def stderr_file_path=(path)
      __return_value = LibGio.subprocess_launcher_set_stderr_file_path(to_unsafe.as(LibGio::SubprocessLauncher*), path ? path.to_unsafe : nil)
      __return_value
    end

    def stdin_file_path=(path)
      __return_value = LibGio.subprocess_launcher_set_stdin_file_path(to_unsafe.as(LibGio::SubprocessLauncher*), path.to_unsafe)
      __return_value
    end

    def stdout_file_path=(path)
      __return_value = LibGio.subprocess_launcher_set_stdout_file_path(to_unsafe.as(LibGio::SubprocessLauncher*), path ? path.to_unsafe : nil)
      __return_value
    end

    def setenv(variable, value, overwrite)
      __return_value = LibGio.subprocess_launcher_setenv(to_unsafe.as(LibGio::SubprocessLauncher*), variable.to_unsafe, value.to_unsafe, overwrite)
      __return_value
    end

    def spawnv(argv)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.subprocess_launcher_spawnv(to_unsafe.as(LibGio::SubprocessLauncher*), argv, pointerof(__error))
      GLib::Error.assert __error
      Gio::Subprocess.new(__return_value)
    end

    def take_fd(source_fd, target_fd)
      __return_value = LibGio.subprocess_launcher_take_fd(to_unsafe.as(LibGio::SubprocessLauncher*), Int32.new(source_fd), Int32.new(target_fd))
      __return_value
    end

    def take_stderr_fd(fd)
      __return_value = LibGio.subprocess_launcher_take_stderr_fd(to_unsafe.as(LibGio::SubprocessLauncher*), Int32.new(fd))
      __return_value
    end

    def take_stdin_fd(fd)
      __return_value = LibGio.subprocess_launcher_take_stdin_fd(to_unsafe.as(LibGio::SubprocessLauncher*), Int32.new(fd))
      __return_value
    end

    def take_stdout_fd(fd)
      __return_value = LibGio.subprocess_launcher_take_stdout_fd(to_unsafe.as(LibGio::SubprocessLauncher*), Int32.new(fd))
      __return_value
    end

    def unsetenv(variable)
      __return_value = LibGio.subprocess_launcher_unsetenv(to_unsafe.as(LibGio::SubprocessLauncher*), variable.to_unsafe)
      __return_value
    end

  end
end

