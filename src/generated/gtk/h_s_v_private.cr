module Gtk
  class HSVPrivate
    include GObject::WrappedType

    @gtk_h_s_v_private : LibGtk::HSVPrivate*?
    def initialize(@gtk_h_s_v_private : LibGtk::HSVPrivate*)
    end

    def to_unsafe
      @gtk_h_s_v_private.not_nil!
    end

  end
end

