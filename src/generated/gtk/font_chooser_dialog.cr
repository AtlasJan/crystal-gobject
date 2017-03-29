require "./dialog"

module Gtk
  class FontChooserDialog < Dialog
    @gtk_font_chooser_dialog : LibGtk::FontChooserDialog*?
    def initialize(@gtk_font_chooser_dialog : LibGtk::FontChooserDialog*)
    end

    def to_unsafe
      @gtk_font_chooser_dialog.not_nil!
    end

    # Implements ImplementorIface
    # Implements Buildable
    # Implements FontChooser
    def self.new(title, parent) : self
      __return_value = LibGtk.font_chooser_dialog_new(title ? title.to_unsafe : nil, parent ? parent.to_unsafe.as(LibGtk::Window*) : nil)
      cast Gtk::Widget.new(__return_value)
    end

  end
end

