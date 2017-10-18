module Gio
  class TlsInteraction < GObject::Object
    @gio_tls_interaction : LibGio::TlsInteraction*?
    def initialize(@gio_tls_interaction : LibGio::TlsInteraction*)
    end

    def to_unsafe
      @gio_tls_interaction.not_nil!
    end

    def ask_password(password, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_interaction_ask_password(to_unsafe.as(LibGio::TlsInteraction*), password.to_unsafe.as(LibGio::TlsPassword*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def ask_password_async(password, cancellable, callback, user_data)
      LibGio.tls_interaction_ask_password_async(to_unsafe.as(LibGio::TlsInteraction*), password.to_unsafe.as(LibGio::TlsPassword*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      nil
    end

    def ask_password_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_interaction_ask_password_finish(to_unsafe.as(LibGio::TlsInteraction*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def invoke_ask_password(password, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_interaction_invoke_ask_password(to_unsafe.as(LibGio::TlsInteraction*), password.to_unsafe.as(LibGio::TlsPassword*), cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def invoke_request_certificate(connection, flags : Gio::TlsCertificateRequestFlags, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_interaction_invoke_request_certificate(to_unsafe.as(LibGio::TlsInteraction*), connection.to_unsafe.as(LibGio::TlsConnection*), flags, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def request_certificate(connection, flags : Gio::TlsCertificateRequestFlags, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_interaction_request_certificate(to_unsafe.as(LibGio::TlsInteraction*), connection.to_unsafe.as(LibGio::TlsConnection*), flags, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def request_certificate_async(connection, flags : Gio::TlsCertificateRequestFlags, cancellable, callback, user_data)
      LibGio.tls_interaction_request_certificate_async(to_unsafe.as(LibGio::TlsInteraction*), connection.to_unsafe.as(LibGio::TlsConnection*), flags, cancellable ? cancellable.to_unsafe.as(LibGio::Cancellable*) : nil, callback ? callback : nil, user_data ? user_data : nil)
      nil
    end

    def request_certificate_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_interaction_request_certificate_finish(to_unsafe.as(LibGio::TlsInteraction*), result.to_unsafe.as(LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

  end
end

