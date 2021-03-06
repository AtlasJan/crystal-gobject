require "./widget"

module Gtk
  class Calendar < Widget
    @pointer : Void*
    def initialize(pointer : LibGtk::Calendar*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::Calendar*)
    end

    # Implements ImplementorIface
    # Implements Buildable
    def day
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "day", gvalue)
      gvalue
    end

    def detail_height_rows
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "detail_height_rows", gvalue)
      gvalue
    end

    def detail_width_chars
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "detail_width_chars", gvalue)
      gvalue
    end

    def month
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "month", gvalue)
      gvalue
    end

    def no_month_change
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "no_month_change", gvalue)
      gvalue.boolean
    end

    def show_day_names
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show_day_names", gvalue)
      gvalue.boolean
    end

    def show_details
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show_details", gvalue)
      gvalue.boolean
    end

    def show_heading
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show_heading", gvalue)
      gvalue.boolean
    end

    def show_week_numbers
      gvalue = GObject::Value.new(GObject::Type::BOOLEAN)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "show_week_numbers", gvalue)
      gvalue.boolean
    end

    def year
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "year", gvalue)
      gvalue
    end

    def self.new : self
      __return_value = LibGtk.calendar_new
      cast Gtk::Widget.new(__return_value)
    end

    def clear_marks
      LibGtk.calendar_clear_marks(@pointer.as(LibGtk::Calendar*))
      nil
    end

    def date(year, month, day)
      LibGtk.calendar_get_date(@pointer.as(LibGtk::Calendar*), year, month, day)
      nil
    end

    def day_is_marked(day)
      __return_value = LibGtk.calendar_get_day_is_marked(@pointer.as(LibGtk::Calendar*), UInt32.new(day))
      __return_value
    end

    def detail_height_rows
      __return_value = LibGtk.calendar_get_detail_height_rows(@pointer.as(LibGtk::Calendar*))
      __return_value
    end

    def detail_width_chars
      __return_value = LibGtk.calendar_get_detail_width_chars(@pointer.as(LibGtk::Calendar*))
      __return_value
    end

    def display_options
      __return_value = LibGtk.calendar_get_display_options(@pointer.as(LibGtk::Calendar*))
      __return_value
    end

    def mark_day(day)
      LibGtk.calendar_mark_day(@pointer.as(LibGtk::Calendar*), UInt32.new(day))
      nil
    end

    def select_day(day)
      LibGtk.calendar_select_day(@pointer.as(LibGtk::Calendar*), UInt32.new(day))
      nil
    end

    def select_month(month, year)
      LibGtk.calendar_select_month(@pointer.as(LibGtk::Calendar*), UInt32.new(month), UInt32.new(year))
      nil
    end

    def set_detail_func(func, data, destroy)
      LibGtk.calendar_set_detail_func(@pointer.as(LibGtk::Calendar*), func, data ? data : nil, destroy)
      nil
    end

    def detail_height_rows=(rows)
      LibGtk.calendar_set_detail_height_rows(@pointer.as(LibGtk::Calendar*), Int32.new(rows))
      nil
    end

    def detail_width_chars=(chars)
      LibGtk.calendar_set_detail_width_chars(@pointer.as(LibGtk::Calendar*), Int32.new(chars))
      nil
    end

    def display_options=(flags : Gtk::CalendarDisplayOptions)
      LibGtk.calendar_set_display_options(@pointer.as(LibGtk::Calendar*), flags)
      nil
    end

    def unmark_day(day)
      LibGtk.calendar_unmark_day(@pointer.as(LibGtk::Calendar*), UInt32.new(day))
      nil
    end

    alias DaySelectedSignal = Calendar ->
    def on_day_selected(&__block : DaySelectedSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("day-selected", __callback)
    end

    alias DaySelectedDoubleClickSignal = Calendar ->
    def on_day_selected_double_click(&__block : DaySelectedDoubleClickSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("day-selected-double-click", __callback)
    end

    alias MonthChangedSignal = Calendar ->
    def on_month_changed(&__block : MonthChangedSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("month-changed", __callback)
    end

    alias NextMonthSignal = Calendar ->
    def on_next_month(&__block : NextMonthSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("next-month", __callback)
    end

    alias NextYearSignal = Calendar ->
    def on_next_year(&__block : NextYearSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("next-year", __callback)
    end

    alias PrevMonthSignal = Calendar ->
    def on_prev_month(&__block : PrevMonthSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("prev-month", __callback)
    end

    alias PrevYearSignal = Calendar ->
    def on_prev_year(&__block : PrevYearSignal)
      __callback = ->(_arg0 : LibGtk::Calendar*) {
       __return_value = __block.call(Calendar.new(_arg0))
       __return_value
      }
      connect("prev-year", __callback)
    end

  end
end

