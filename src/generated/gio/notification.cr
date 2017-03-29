module Gio
  class Notification < GObject::Object
    @gio_notification : LibGio::Notification*?
    def initialize(@gio_notification : LibGio::Notification*)
    end

    def to_unsafe
      @gio_notification.not_nil!
    end

    def self.new(title) : self
      __return_value = LibGio.notification_new(title)
      cast Gio::Notification.new(__return_value)
    end

    def add_button(label, detailed_action)
      __return_value = LibGio.notification_add_button(to_unsafe.as(LibGio::Notification*), label, detailed_action)
      __return_value
    end

    def add_button_with_target(label, action, target)
      __return_value = LibGio.notification_add_button_with_target(to_unsafe.as(LibGio::Notification*), label, action, target && target.to_unsafe.as(LibGLib::Variant*))
      __return_value
    end

    def body=(body)
      __return_value = LibGio.notification_set_body(to_unsafe.as(LibGio::Notification*), body)
      __return_value
    end

    def default_action=(detailed_action)
      __return_value = LibGio.notification_set_default_action(to_unsafe.as(LibGio::Notification*), detailed_action)
      __return_value
    end

    def set_default_action_and_target(action, target)
      __return_value = LibGio.notification_set_default_action_and_target(to_unsafe.as(LibGio::Notification*), action, target && target.to_unsafe.as(LibGLib::Variant*))
      __return_value
    end

    def icon=(icon)
      __return_value = LibGio.notification_set_icon(to_unsafe.as(LibGio::Notification*), icon.to_unsafe.as(LibGio::Icon*))
      __return_value
    end

    def priority=(priority : Gio::NotificationPriority)
      __return_value = LibGio.notification_set_priority(to_unsafe.as(LibGio::Notification*), priority)
      __return_value
    end

    def title=(title)
      __return_value = LibGio.notification_set_title(to_unsafe.as(LibGio::Notification*), title)
      __return_value
    end

    def urgent=(urgent)
      __return_value = LibGio.notification_set_urgent(to_unsafe.as(LibGio::Notification*), urgent)
      __return_value
    end

  end
end

