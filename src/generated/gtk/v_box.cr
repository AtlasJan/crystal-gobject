require "./box"

module Gtk
  class VBox < Box
    @gtk_v_box : LibGtk::VBox*?
    def initialize(@gtk_v_box : LibGtk::VBox*)
    end

    def to_unsafe
      @gtk_v_box.not_nil!
    end

    # Implements ImplementorIface
    # Implements Buildable
    # Implements Orientable
    def self.new(homogeneous, spacing) : self
      __return_value = LibGtk.v_box_new(homogeneous, Int32.new(spacing))
      cast Gtk::Widget.new(__return_value)
    end

  end
end

