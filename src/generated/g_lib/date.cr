module GLib
  class Date
    include GObject::WrappedType

    def self.new(julian_days : UInt32|Nil = nil, julian : UInt32|Nil = nil, dmy : UInt32|Nil = nil, day : UInt32|Nil = nil, month : UInt32|Nil = nil, year : UInt32|Nil = nil) : self
      ptr = Pointer(UInt8).malloc(24, 0u8)
      new(ptr.as(LibGLib::Date*)).tap do |object|
        object.julian_days = julian_days unless julian_days.nil?
        object.julian = julian unless julian.nil?
        object.dmy = dmy unless dmy.nil?
        object.day = day unless day.nil?
        object.month = month unless month.nil?
        object.year = year unless year.nil?
      end
    end

    @g_lib_date : LibGLib::Date*?
    def initialize(@g_lib_date : LibGLib::Date*)
    end

    def to_unsafe
      @g_lib_date.not_nil!
    end

    def self.new : self
      __return_value = LibGLib.date_new
      cast GLib::Date.new(__return_value)
    end

    def self.new_dmy(day, month : GLib::DateMonth, year) : self
      __return_value = LibGLib.date_new_dmy(UInt8.new(day), month, UInt16.new(year))
      cast GLib::Date.new(__return_value)
    end

    def self.new_julian(julian_day) : self
      __return_value = LibGLib.date_new_julian(UInt32.new(julian_day))
      cast GLib::Date.new(__return_value)
    end

    def add_days(n_days)
      __return_value = LibGLib.date_add_days(to_unsafe.as(LibGLib::Date*), UInt32.new(n_days))
      __return_value
    end

    def add_months(n_months)
      __return_value = LibGLib.date_add_months(to_unsafe.as(LibGLib::Date*), UInt32.new(n_months))
      __return_value
    end

    def add_years(n_years)
      __return_value = LibGLib.date_add_years(to_unsafe.as(LibGLib::Date*), UInt32.new(n_years))
      __return_value
    end

    def clamp(min_date, max_date)
      __return_value = LibGLib.date_clamp(to_unsafe.as(LibGLib::Date*), min_date.to_unsafe.as(LibGLib::Date*), max_date.to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def clear(n_dates)
      __return_value = LibGLib.date_clear(to_unsafe.as(LibGLib::Date*), UInt32.new(n_dates))
      __return_value
    end

    def compare(rhs)
      __return_value = LibGLib.date_compare(to_unsafe.as(LibGLib::Date*), rhs.to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def days_between(date2)
      __return_value = LibGLib.date_days_between(to_unsafe.as(LibGLib::Date*), date2.to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def free
      __return_value = LibGLib.date_free(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def day
      __return_value = LibGLib.date_get_day(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def day_of_year
      __return_value = LibGLib.date_get_day_of_year(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def iso8601_week_of_year
      __return_value = LibGLib.date_get_iso8601_week_of_year(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def julian
      __return_value = LibGLib.date_get_julian(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def monday_week_of_year
      __return_value = LibGLib.date_get_monday_week_of_year(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def month
      __return_value = LibGLib.date_get_month(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def sunday_week_of_year
      __return_value = LibGLib.date_get_sunday_week_of_year(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def weekday
      __return_value = LibGLib.date_get_weekday(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def year
      __return_value = LibGLib.date_get_year(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def first_of_month?
      __return_value = LibGLib.date_is_first_of_month(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def last_of_month?
      __return_value = LibGLib.date_is_last_of_month(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def order(date2)
      __return_value = LibGLib.date_order(to_unsafe.as(LibGLib::Date*), date2.to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def day=(day)
      __return_value = LibGLib.date_set_day(to_unsafe.as(LibGLib::Date*), UInt8.new(day))
      __return_value
    end

    def set_dmy(day, month : GLib::DateMonth, y)
      __return_value = LibGLib.date_set_dmy(to_unsafe.as(LibGLib::Date*), UInt8.new(day), month, UInt16.new(y))
      __return_value
    end

    def julian=(julian_date)
      __return_value = LibGLib.date_set_julian(to_unsafe.as(LibGLib::Date*), UInt32.new(julian_date))
      __return_value
    end

    def month=(month : GLib::DateMonth)
      __return_value = LibGLib.date_set_month(to_unsafe.as(LibGLib::Date*), month)
      __return_value
    end

    def parse=(str)
      __return_value = LibGLib.date_set_parse(to_unsafe.as(LibGLib::Date*), str.to_unsafe)
      __return_value
    end

    def time=(time)
      __return_value = LibGLib.date_set_time(to_unsafe.as(LibGLib::Date*), Int32.new(time))
      __return_value
    end

    def time_t=(timet)
      __return_value = LibGLib.date_set_time_t(to_unsafe.as(LibGLib::Date*), Int64.new(timet))
      __return_value
    end

    def time_val=(timeval)
      __return_value = LibGLib.date_set_time_val(to_unsafe.as(LibGLib::Date*), timeval.to_unsafe.as(LibGLib::TimeVal*))
      __return_value
    end

    def year=(year)
      __return_value = LibGLib.date_set_year(to_unsafe.as(LibGLib::Date*), UInt16.new(year))
      __return_value
    end

    def subtract_days(n_days)
      __return_value = LibGLib.date_subtract_days(to_unsafe.as(LibGLib::Date*), UInt32.new(n_days))
      __return_value
    end

    def subtract_months(n_months)
      __return_value = LibGLib.date_subtract_months(to_unsafe.as(LibGLib::Date*), UInt32.new(n_months))
      __return_value
    end

    def subtract_years(n_years)
      __return_value = LibGLib.date_subtract_years(to_unsafe.as(LibGLib::Date*), UInt32.new(n_years))
      __return_value
    end

    def to_struct_tm(tm)
      __return_value = LibGLib.date_to_struct_tm(to_unsafe.as(LibGLib::Date*), tm)
      __return_value
    end

    def valid
      __return_value = LibGLib.date_valid(to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def self.days_in_month(month : GLib::DateMonth, year)
      __return_value = LibGLib.date_get_days_in_month(month, UInt16.new(year))
      __return_value
    end

    def self.monday_weeks_in_year(year)
      __return_value = LibGLib.date_get_monday_weeks_in_year(UInt16.new(year))
      __return_value
    end

    def self.sunday_weeks_in_year(year)
      __return_value = LibGLib.date_get_sunday_weeks_in_year(UInt16.new(year))
      __return_value
    end

    def self.leap_year?(year)
      __return_value = LibGLib.date_is_leap_year(UInt16.new(year))
      __return_value
    end

    def self.strftime(s, slen, format, date)
      __return_value = LibGLib.date_strftime(s.to_unsafe, UInt64.new(slen), format.to_unsafe, date.to_unsafe.as(LibGLib::Date*))
      __return_value
    end

    def self.valid_day(day)
      __return_value = LibGLib.date_valid_day(UInt8.new(day))
      __return_value
    end

    def self.valid_dmy(day, month : GLib::DateMonth, year)
      __return_value = LibGLib.date_valid_dmy(UInt8.new(day), month, UInt16.new(year))
      __return_value
    end

    def self.valid_julian(julian_date)
      __return_value = LibGLib.date_valid_julian(UInt32.new(julian_date))
      __return_value
    end

    def self.valid_month(month : GLib::DateMonth)
      __return_value = LibGLib.date_valid_month(month)
      __return_value
    end

    def self.valid_weekday(weekday : GLib::DateWeekday)
      __return_value = LibGLib.date_valid_weekday(weekday)
      __return_value
    end

    def self.valid_year(year)
      __return_value = LibGLib.date_valid_year(UInt16.new(year))
      __return_value
    end

    def julian_days
      (to_unsafe.as(LibGLib::Date*).value.julian_days)
    end

    def julian_days=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.julian_days = UInt32.new(value)
    end

    def julian
      (to_unsafe.as(LibGLib::Date*).value.julian)
    end

    def julian=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.julian = UInt32.new(value)
    end

    def dmy
      (to_unsafe.as(LibGLib::Date*).value.dmy)
    end

    def dmy=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.dmy = UInt32.new(value)
    end

    def day
      (to_unsafe.as(LibGLib::Date*).value.day)
    end

    def day=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.day = UInt32.new(value)
    end

    def month
      (to_unsafe.as(LibGLib::Date*).value.month)
    end

    def month=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.month = UInt32.new(value)
    end

    def year
      (to_unsafe.as(LibGLib::Date*).value.year)
    end

    def year=(value : UInt32)
      to_unsafe.as(LibGLib::Date*).value.year = UInt32.new(value)
    end

  end
end

