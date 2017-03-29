module Gio
  class IOSchedulerJob
    include GObject::WrappedType

    @gio_i_o_scheduler_job : LibGio::IOSchedulerJob*?
    def initialize(@gio_i_o_scheduler_job : LibGio::IOSchedulerJob*)
    end

    def to_unsafe
      @gio_i_o_scheduler_job.not_nil!
    end

    def send_to_mainloop(func, user_data, notify)
      __return_value = LibGio.i_o_scheduler_job_send_to_mainloop(to_unsafe.as(LibGio::IOSchedulerJob*), func, user_data && user_data, notify && notify)
      __return_value
    end

    def send_to_mainloop_async(func, user_data, notify)
      __return_value = LibGio.i_o_scheduler_job_send_to_mainloop_async(to_unsafe.as(LibGio::IOSchedulerJob*), func, user_data && user_data, notify && notify)
      __return_value
    end

  end
end

