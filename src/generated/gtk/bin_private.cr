module Gtk
  class BinPrivate
    include GObject::WrappedType

    @gtk_bin_private : LibGtk::BinPrivate*?
    def initialize(@gtk_bin_private : LibGtk::BinPrivate*)
    end

    def to_unsafe
      @gtk_bin_private.not_nil!
    end

  end
end

