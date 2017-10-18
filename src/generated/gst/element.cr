require "./object"

module Gst
  class Element < Object
    @gst_element : LibGst::Element*?
    def initialize(@gst_element : LibGst::Element*)
    end

    def to_unsafe
      @gst_element.not_nil!
    end

    def self.make_from_uri(type : Gst::URIType, uri, elementname)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGst.element_make_from_uri(type, uri.to_unsafe, elementname ? elementname.to_unsafe : nil, pointerof(__error))
      GLib::Error.assert __error
      Gst::Element.new(__return_value)
    end

    def self.register(plugin, name, rank, type)
      __return_value = LibGst.element_register(plugin ? plugin.to_unsafe.as(LibGst::Plugin*) : nil, name.to_unsafe, UInt32.new(rank), UInt64.new(type))
      __return_value
    end

    def self.state_change_return_get_name(state_ret : Gst::StateChangeReturn)
      __return_value = LibGst.element_state_change_return_get_name(state_ret)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def self.state_get_name(state : Gst::State)
      __return_value = LibGst.element_state_get_name(state)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def abort_state
      LibGst.element_abort_state(to_unsafe.as(LibGst::Element*))
      nil
    end

    def add_pad(pad)
      __return_value = LibGst.element_add_pad(to_unsafe.as(LibGst::Element*), pad.to_unsafe.as(LibGst::Pad*))
      __return_value
    end

    def add_property_deep_notify_watch(property_name, include_value)
      __return_value = LibGst.element_add_property_deep_notify_watch(to_unsafe.as(LibGst::Element*), property_name ? property_name.to_unsafe : nil, include_value)
      __return_value
    end

    def add_property_notify_watch(property_name, include_value)
      __return_value = LibGst.element_add_property_notify_watch(to_unsafe.as(LibGst::Element*), property_name ? property_name.to_unsafe : nil, include_value)
      __return_value
    end

    def call_async(func, user_data, destroy_notify)
      LibGst.element_call_async(to_unsafe.as(LibGst::Element*), func, user_data ? user_data : nil, destroy_notify)
      nil
    end

    def change_state(transition : Gst::StateChange)
      __return_value = LibGst.element_change_state(to_unsafe.as(LibGst::Element*), transition)
      __return_value
    end

    def continue_state(ret : Gst::StateChangeReturn)
      __return_value = LibGst.element_continue_state(to_unsafe.as(LibGst::Element*), ret)
      __return_value
    end

    def create_all_pads
      LibGst.element_create_all_pads(to_unsafe.as(LibGst::Element*))
      nil
    end

    def base_time
      __return_value = LibGst.element_get_base_time(to_unsafe.as(LibGst::Element*))
      __return_value
    end

    def bus
      __return_value = LibGst.element_get_bus(to_unsafe.as(LibGst::Element*))
      Gst::Bus.new(__return_value)
    end

    def clock
      __return_value = LibGst.element_get_clock(to_unsafe.as(LibGst::Element*))
      Gst::Clock.new(__return_value)
    end

    def compatible_pad(pad, caps)
      __return_value = LibGst.element_get_compatible_pad(to_unsafe.as(LibGst::Element*), pad.to_unsafe.as(LibGst::Pad*), caps ? caps.to_unsafe.as(LibGst::Caps*) : nil)
      Gst::Pad.new(__return_value) if __return_value
    end

    def compatible_pad_template(compattempl)
      __return_value = LibGst.element_get_compatible_pad_template(to_unsafe.as(LibGst::Element*), compattempl.to_unsafe.as(LibGst::PadTemplate*))
      Gst::PadTemplate.new(__return_value) if __return_value
    end

    def context(context_type)
      __return_value = LibGst.element_get_context(to_unsafe.as(LibGst::Element*), context_type.to_unsafe)
      Gst::Context.new(__return_value)
    end

    def context_unlocked(context_type)
      __return_value = LibGst.element_get_context_unlocked(to_unsafe.as(LibGst::Element*), context_type.to_unsafe)
      Gst::Context.new(__return_value)
    end

    def contexts
      __return_value = LibGst.element_get_contexts(to_unsafe.as(LibGst::Element*))
      GLib::ListIterator(Gst::Context, LibGst::Context*).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def factory
      __return_value = LibGst.element_get_factory(to_unsafe.as(LibGst::Element*))
      Gst::ElementFactory.new(__return_value)
    end

    def request_pad(name)
      __return_value = LibGst.element_get_request_pad(to_unsafe.as(LibGst::Element*), name.to_unsafe)
      Gst::Pad.new(__return_value) if __return_value
    end

    def start_time
      __return_value = LibGst.element_get_start_time(to_unsafe.as(LibGst::Element*))
      __return_value
    end

    def state(state : Gst::State?, pending : Gst::State?, timeout)
      __return_value = LibGst.element_get_state(to_unsafe.as(LibGst::Element*), state, pending, UInt64.new(timeout))
      __return_value
    end

    def static_pad(name)
      __return_value = LibGst.element_get_static_pad(to_unsafe.as(LibGst::Element*), name.to_unsafe)
      Gst::Pad.new(__return_value) if __return_value
    end

    def locked_state?
      __return_value = LibGst.element_is_locked_state(to_unsafe.as(LibGst::Element*))
      __return_value
    end

    def iterate_pads
      __return_value = LibGst.element_iterate_pads(to_unsafe.as(LibGst::Element*))
      Gst::Iterator.new(__return_value)
    end

    def iterate_sink_pads
      __return_value = LibGst.element_iterate_sink_pads(to_unsafe.as(LibGst::Element*))
      Gst::Iterator.new(__return_value)
    end

    def iterate_src_pads
      __return_value = LibGst.element_iterate_src_pads(to_unsafe.as(LibGst::Element*))
      Gst::Iterator.new(__return_value)
    end

    def link(dest)
      __return_value = LibGst.element_link(to_unsafe.as(LibGst::Element*), dest.to_unsafe.as(LibGst::Element*))
      __return_value
    end

    def link_filtered(dest, filter)
      __return_value = LibGst.element_link_filtered(to_unsafe.as(LibGst::Element*), dest.to_unsafe.as(LibGst::Element*), filter ? filter.to_unsafe.as(LibGst::Caps*) : nil)
      __return_value
    end

    def link_pads(srcpadname, dest, destpadname)
      __return_value = LibGst.element_link_pads(to_unsafe.as(LibGst::Element*), srcpadname ? srcpadname.to_unsafe : nil, dest.to_unsafe.as(LibGst::Element*), destpadname ? destpadname.to_unsafe : nil)
      __return_value
    end

    def link_pads_filtered(srcpadname, dest, destpadname, filter)
      __return_value = LibGst.element_link_pads_filtered(to_unsafe.as(LibGst::Element*), srcpadname ? srcpadname.to_unsafe : nil, dest.to_unsafe.as(LibGst::Element*), destpadname ? destpadname.to_unsafe : nil, filter ? filter.to_unsafe.as(LibGst::Caps*) : nil)
      __return_value
    end

    def link_pads_full(srcpadname, dest, destpadname, flags : Gst::PadLinkCheck)
      __return_value = LibGst.element_link_pads_full(to_unsafe.as(LibGst::Element*), srcpadname ? srcpadname.to_unsafe : nil, dest.to_unsafe.as(LibGst::Element*), destpadname ? destpadname.to_unsafe : nil, flags)
      __return_value
    end

    def lost_state
      LibGst.element_lost_state(to_unsafe.as(LibGst::Element*))
      nil
    end

    def message_full(type : Gst::MessageType, domain, code, text, debug, file, function, line)
      LibGst.element_message_full(to_unsafe.as(LibGst::Element*), type, UInt32.new(domain), Int32.new(code), text ? text.to_unsafe : nil, debug ? debug.to_unsafe : nil, file.to_unsafe, function.to_unsafe, Int32.new(line))
      nil
    end

    def message_full_with_details(type : Gst::MessageType, domain, code, text, debug, file, function, line, structure)
      LibGst.element_message_full_with_details(to_unsafe.as(LibGst::Element*), type, UInt32.new(domain), Int32.new(code), text ? text.to_unsafe : nil, debug ? debug.to_unsafe : nil, file.to_unsafe, function.to_unsafe, Int32.new(line), structure.to_unsafe.as(LibGst::Structure*))
      nil
    end

    def no_more_pads
      LibGst.element_no_more_pads(to_unsafe.as(LibGst::Element*))
      nil
    end

    def post_message(message)
      __return_value = LibGst.element_post_message(to_unsafe.as(LibGst::Element*), message.to_unsafe.as(LibGst::Message*))
      __return_value
    end

    def provide_clock
      __return_value = LibGst.element_provide_clock(to_unsafe.as(LibGst::Element*))
      Gst::Clock.new(__return_value) if __return_value
    end

    def query(query)
      __return_value = LibGst.element_query(to_unsafe.as(LibGst::Element*), query.to_unsafe.as(LibGst::Query*))
      __return_value
    end

    def query_convert(src_format : Gst::Format, src_val, dest_format : Gst::Format, dest_val)
      __return_value = LibGst.element_query_convert(to_unsafe.as(LibGst::Element*), src_format, Int64.new(src_val), dest_format, dest_val)
      __return_value
    end

    def query_duration(format : Gst::Format, duration)
      __return_value = LibGst.element_query_duration(to_unsafe.as(LibGst::Element*), format, duration)
      __return_value
    end

    def query_position(format : Gst::Format, cur)
      __return_value = LibGst.element_query_position(to_unsafe.as(LibGst::Element*), format, cur)
      __return_value
    end

    def release_request_pad(pad)
      LibGst.element_release_request_pad(to_unsafe.as(LibGst::Element*), pad.to_unsafe.as(LibGst::Pad*))
      nil
    end

    def remove_pad(pad)
      __return_value = LibGst.element_remove_pad(to_unsafe.as(LibGst::Element*), pad.to_unsafe.as(LibGst::Pad*))
      __return_value
    end

    def remove_property_notify_watch(watch_id)
      LibGst.element_remove_property_notify_watch(to_unsafe.as(LibGst::Element*), UInt64.new(watch_id))
      nil
    end

    def request_pad(templ, name, caps)
      __return_value = LibGst.element_request_pad(to_unsafe.as(LibGst::Element*), templ.to_unsafe.as(LibGst::PadTemplate*), name ? name.to_unsafe : nil, caps ? caps.to_unsafe.as(LibGst::Caps*) : nil)
      Gst::Pad.new(__return_value) if __return_value
    end

    def seek(rate, format : Gst::Format, flags : Gst::SeekFlags, start_type : Gst::SeekType, start, stop_type : Gst::SeekType, stop)
      __return_value = LibGst.element_seek(to_unsafe.as(LibGst::Element*), Float64.new(rate), format, flags, start_type, Int64.new(start), stop_type, Int64.new(stop))
      __return_value
    end

    def seek_simple(format : Gst::Format, seek_flags : Gst::SeekFlags, seek_pos)
      __return_value = LibGst.element_seek_simple(to_unsafe.as(LibGst::Element*), format, seek_flags, Int64.new(seek_pos))
      __return_value
    end

    def send_event(event)
      __return_value = LibGst.element_send_event(to_unsafe.as(LibGst::Element*), event.to_unsafe.as(LibGst::Event*))
      __return_value
    end

    def base_time=(time)
      LibGst.element_set_base_time(to_unsafe.as(LibGst::Element*), UInt64.new(time))
      nil
    end

    def bus=(bus)
      LibGst.element_set_bus(to_unsafe.as(LibGst::Element*), bus.to_unsafe.as(LibGst::Bus*))
      nil
    end

    def clock=(clock)
      __return_value = LibGst.element_set_clock(to_unsafe.as(LibGst::Element*), clock.to_unsafe.as(LibGst::Clock*))
      __return_value
    end

    def context=(context)
      LibGst.element_set_context(to_unsafe.as(LibGst::Element*), context.to_unsafe.as(LibGst::Context*))
      nil
    end

    def locked_state=(locked_state)
      __return_value = LibGst.element_set_locked_state(to_unsafe.as(LibGst::Element*), locked_state)
      __return_value
    end

    def start_time=(time)
      LibGst.element_set_start_time(to_unsafe.as(LibGst::Element*), UInt64.new(time))
      nil
    end

    def state=(state : Gst::State)
      __return_value = LibGst.element_set_state(to_unsafe.as(LibGst::Element*), state)
      __return_value
    end

    def sync_state_with_parent
      __return_value = LibGst.element_sync_state_with_parent(to_unsafe.as(LibGst::Element*))
      __return_value
    end

    def unlink(dest)
      LibGst.element_unlink(to_unsafe.as(LibGst::Element*), dest.to_unsafe.as(LibGst::Element*))
      nil
    end

    def unlink_pads(srcpadname, dest, destpadname)
      LibGst.element_unlink_pads(to_unsafe.as(LibGst::Element*), srcpadname.to_unsafe, dest.to_unsafe.as(LibGst::Element*), destpadname.to_unsafe)
      nil
    end

    alias NoMorePadsSignal = Element ->
    def on_no_more_pads(&__block : NoMorePadsSignal)
      __callback = ->(_arg0 : LibGst::Element*) {
       __return_value = __block.call(Element.new(_arg0))
       __return_value
      }
      connect("no-more-pads", __callback)
    end

    alias PadAddedSignal = Element, Gst::Pad ->
    def on_pad_added(&__block : PadAddedSignal)
      __callback = ->(_arg0 : LibGst::Element*, _arg1 : LibGst::LibGst::Pad*) {
       __return_value = __block.call(Element.new(_arg0), Gst::Pad.new(_arg1))
       __return_value
      }
      connect("pad-added", __callback)
    end

    alias PadRemovedSignal = Element, Gst::Pad ->
    def on_pad_removed(&__block : PadRemovedSignal)
      __callback = ->(_arg0 : LibGst::Element*, _arg1 : LibGst::LibGst::Pad*) {
       __return_value = __block.call(Element.new(_arg0), Gst::Pad.new(_arg1))
       __return_value
      }
      connect("pad-removed", __callback)
    end

  end
end

