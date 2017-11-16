module Gdk
  class Keymap < GObject::Object
    @pointer : Void*
    def initialize(pointer : LibGdk::Keymap*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGdk::Keymap*)
    end

    def self.default
      __return_value = LibGdk.keymap_get_default
      Gdk::Keymap.new(__return_value)
    end

    def self.for_display(display)
      __return_value = LibGdk.keymap_get_for_display(display.to_unsafe.as(LibGdk::Display*))
      Gdk::Keymap.new(__return_value)
    end

    def add_virtual_modifiers(state : Gdk::ModifierType)
      LibGdk.keymap_add_virtual_modifiers(@pointer.as(LibGdk::Keymap*), state)
      nil
    end

    def caps_lock_state
      __return_value = LibGdk.keymap_get_caps_lock_state(@pointer.as(LibGdk::Keymap*))
      __return_value
    end

    def direction
      __return_value = LibGdk.keymap_get_direction(@pointer.as(LibGdk::Keymap*))
      __return_value
    end

    def entries_for_keycode(hardware_keycode, keys, keyvals, n_entries)
      __return_value = LibGdk.keymap_get_entries_for_keycode(@pointer.as(LibGdk::Keymap*), UInt32.new(hardware_keycode), keys, keyvals, n_entries)
      __return_value
    end

    def entries_for_keyval(keyval, keys, n_keys)
      __return_value = LibGdk.keymap_get_entries_for_keyval(@pointer.as(LibGdk::Keymap*), UInt32.new(keyval), keys, n_keys)
      __return_value
    end

    def modifier_mask(intent : Gdk::ModifierIntent)
      __return_value = LibGdk.keymap_get_modifier_mask(@pointer.as(LibGdk::Keymap*), intent)
      __return_value
    end

    def modifier_state
      __return_value = LibGdk.keymap_get_modifier_state(@pointer.as(LibGdk::Keymap*))
      __return_value
    end

    def num_lock_state
      __return_value = LibGdk.keymap_get_num_lock_state(@pointer.as(LibGdk::Keymap*))
      __return_value
    end

    def scroll_lock_state
      __return_value = LibGdk.keymap_get_scroll_lock_state(@pointer.as(LibGdk::Keymap*))
      __return_value
    end

    def have_bidi_layouts
      __return_value = LibGdk.keymap_have_bidi_layouts(@pointer.as(LibGdk::Keymap*))
      __return_value
    end

    def lookup_key(key)
      __return_value = LibGdk.keymap_lookup_key(@pointer.as(LibGdk::Keymap*), key.to_unsafe.as(LibGdk::KeymapKey*))
      __return_value
    end

    def map_virtual_modifiers(state : Gdk::ModifierType)
      __return_value = LibGdk.keymap_map_virtual_modifiers(@pointer.as(LibGdk::Keymap*), state)
      __return_value
    end

    def translate_keyboard_state(hardware_keycode, state : Gdk::ModifierType, group, keyval, effective_group, level, consumed_modifiers : Gdk::ModifierType?)
      __return_value = LibGdk.keymap_translate_keyboard_state(@pointer.as(LibGdk::Keymap*), UInt32.new(hardware_keycode), state, Int32.new(group), keyval, effective_group, level, consumed_modifiers)
      __return_value
    end

    alias DirectionChangedSignal = Keymap ->
    def on_direction_changed(&__block : DirectionChangedSignal)
      __callback = ->(_arg0 : LibGdk::Keymap*) {
       __return_value = __block.call(Keymap.new(_arg0))
       __return_value
      }
      connect("direction-changed", __callback)
    end

    alias KeysChangedSignal = Keymap ->
    def on_keys_changed(&__block : KeysChangedSignal)
      __callback = ->(_arg0 : LibGdk::Keymap*) {
       __return_value = __block.call(Keymap.new(_arg0))
       __return_value
      }
      connect("keys-changed", __callback)
    end

    alias StateChangedSignal = Keymap ->
    def on_state_changed(&__block : StateChangedSignal)
      __callback = ->(_arg0 : LibGdk::Keymap*) {
       __return_value = __block.call(Keymap.new(_arg0))
       __return_value
      }
      connect("state-changed", __callback)
    end

  end
end

