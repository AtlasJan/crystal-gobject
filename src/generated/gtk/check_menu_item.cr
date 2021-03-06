require "./menu_item"

module Gtk
  class CheckMenuItem < MenuItem
    @pointer : Void*
    def initialize(pointer : LibGtk::CheckMenuItem*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::CheckMenuItem*)
    end

    # Implements ImplementorIface
    # Implements Actionable
    # Implements Activatable
    # Implements Buildable
    def active
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "active", gvalue)
      gvalue.boolean
    end

    def draw_as_radio
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "draw_as_radio", gvalue)
      gvalue.boolean
    end

    def inconsistent
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "inconsistent", gvalue)
      gvalue.boolean
    end

    def self.new : self
      __return_value = LibGtk.check_menu_item_new
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_label(label) : self
      __return_value = LibGtk.check_menu_item_new_with_label(label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_mnemonic(label) : self
      __return_value = LibGtk.check_menu_item_new_with_mnemonic(label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def active
      __return_value = LibGtk.check_menu_item_get_active(@pointer.as(LibGtk::CheckMenuItem*))
      __return_value
    end

    def draw_as_radio
      __return_value = LibGtk.check_menu_item_get_draw_as_radio(@pointer.as(LibGtk::CheckMenuItem*))
      __return_value
    end

    def inconsistent
      __return_value = LibGtk.check_menu_item_get_inconsistent(@pointer.as(LibGtk::CheckMenuItem*))
      __return_value
    end

    def active=(is_active)
      LibGtk.check_menu_item_set_active(@pointer.as(LibGtk::CheckMenuItem*), is_active)
      nil
    end

    def draw_as_radio=(draw_as_radio)
      LibGtk.check_menu_item_set_draw_as_radio(@pointer.as(LibGtk::CheckMenuItem*), draw_as_radio)
      nil
    end

    def inconsistent=(setting)
      LibGtk.check_menu_item_set_inconsistent(@pointer.as(LibGtk::CheckMenuItem*), setting)
      nil
    end

    def toggled
      LibGtk.check_menu_item_toggled(@pointer.as(LibGtk::CheckMenuItem*))
      nil
    end

    alias ToggledSignal = CheckMenuItem ->
    def on_toggled(&__block : ToggledSignal)
      __callback = ->(_arg0 : LibGtk::CheckMenuItem*) {
       __return_value = __block.call(CheckMenuItem.new(_arg0))
       __return_value
      }
      connect("toggled", __callback)
    end

  end
end

