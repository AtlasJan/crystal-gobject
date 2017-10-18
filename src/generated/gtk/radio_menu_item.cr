require "./check_menu_item"

module Gtk
  class RadioMenuItem < CheckMenuItem
    @gtk_radio_menu_item : LibGtk::RadioMenuItem*?
    def initialize(@gtk_radio_menu_item : LibGtk::RadioMenuItem*)
    end

    def to_unsafe
      @gtk_radio_menu_item.not_nil!
    end

    # Implements ImplementorIface
    # Implements Actionable
    # Implements Activatable
    # Implements Buildable

    def self.new(group) : self
      __return_value = LibGtk.radio_menu_item_new(group ? group : nil)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_from_widget(group) : self
      __return_value = LibGtk.radio_menu_item_new_from_widget(group ? group.to_unsafe.as(LibGtk::RadioMenuItem*) : nil)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_label(group, label) : self
      __return_value = LibGtk.radio_menu_item_new_with_label(group ? group : nil, label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_label_from_widget(group, label) : self
      __return_value = LibGtk.radio_menu_item_new_with_label_from_widget(group ? group.to_unsafe.as(LibGtk::RadioMenuItem*) : nil, label ? label.to_unsafe : nil)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_mnemonic(group, label) : self
      __return_value = LibGtk.radio_menu_item_new_with_mnemonic(group ? group : nil, label.to_unsafe)
      cast Gtk::Widget.new(__return_value)
    end

    def self.new_with_mnemonic_from_widget(group, label) : self
      __return_value = LibGtk.radio_menu_item_new_with_mnemonic_from_widget(group ? group.to_unsafe.as(LibGtk::RadioMenuItem*) : nil, label ? label.to_unsafe : nil)
      cast Gtk::Widget.new(__return_value)
    end

    def group
      __return_value = LibGtk.radio_menu_item_get_group(to_unsafe.as(LibGtk::RadioMenuItem*))
      GLib::SListIterator(Gtk::RadioMenuItem, LibGtk::RadioMenuItem*).new(GLib::SList.new(__return_value.as(LibGLib::SList*)))
    end

    def join_group(group_source)
      LibGtk.radio_menu_item_join_group(to_unsafe.as(LibGtk::RadioMenuItem*), group_source ? group_source.to_unsafe.as(LibGtk::RadioMenuItem*) : nil)
      nil
    end

    def group=(group)
      LibGtk.radio_menu_item_set_group(to_unsafe.as(LibGtk::RadioMenuItem*), group ? group : nil)
      nil
    end

    alias GroupChangedSignal = RadioMenuItem ->
    def on_group_changed(&__block : GroupChangedSignal)
      __callback = ->(_arg0 : LibGtk::RadioMenuItem*) {
       __return_value = __block.call(RadioMenuItem.new(_arg0))
       __return_value
      }
      connect("group-changed", __callback)
    end

  end
end

