module Gtk
  class TextTag < GObject::Object
    @gtk_text_tag : LibGtk::TextTag*?
    def initialize(@gtk_text_tag : LibGtk::TextTag*)
    end

    def to_unsafe
      @gtk_text_tag.not_nil!
    end











































































    def self.new(name) : self
      __return_value = LibGtk.text_tag_new(name)
      cast Gtk::TextTag.new(__return_value)
    end

    def changed(size_changed)
      __return_value = LibGtk.text_tag_changed(to_unsafe.as(LibGtk::TextTag*), size_changed)
      __return_value
    end

    def event(event_object, event, iter)
      __return_value = LibGtk.text_tag_event(to_unsafe.as(LibGtk::TextTag*), event_object.to_unsafe.as(LibGObject::Object*), event.to_unsafe.as(LibGdk::Event*), iter.to_unsafe.as(LibGtk::TextIter*))
      __return_value
    end

    def priority
      __return_value = LibGtk.text_tag_get_priority(to_unsafe.as(LibGtk::TextTag*))
      __return_value
    end

    def priority=(priority)
      __return_value = LibGtk.text_tag_set_priority(to_unsafe.as(LibGtk::TextTag*), Int32.new(priority))
      __return_value
    end

    alias EventSignal = TextTag, GObject::Object, Gdk::Event, Gtk::TextIter -> Bool
    def on_event(&__block : EventSignal)
      __callback = ->(_arg0 : LibGtk::TextTag*, _arg1 : LibGtk::LibGObject::Object*, _arg2 : LibGtk::LibGdk::Event*, _arg3 : LibGtk::LibGtk::TextIter*) {
       __return_value = __block.call(TextTag.new(_arg0), GObject::Object.new(_arg1), Gdk::Event.new(_arg2), Gtk::TextIter.new(_arg3))
       __return_value
      }
      connect("event", __callback)
    end

  end
end

