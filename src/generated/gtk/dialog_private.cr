module Gtk
  class DialogPrivate
    include GObject::WrappedType

    @gtk_dialog_private : LibGtk::DialogPrivate*?
    def initialize(@gtk_dialog_private : LibGtk::DialogPrivate*)
    end

    def to_unsafe
      @gtk_dialog_private.not_nil!
    end

  end
end

