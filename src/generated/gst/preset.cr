module Gst
  module Preset
    def self.app_dir
      __return_value = LibGst.preset_get_app_dir
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value)) if __return_value
    end

    def self.set_app_dir(app_dir)
      __return_value = LibGst.preset_set_app_dir(app_dir.to_unsafe)
      __return_value
    end

    def delete_preset(name)
      __return_value = LibGst.preset_delete_preset(@pointer.as(LibGst::Preset*), name.to_unsafe)
      __return_value
    end

    def meta(name, tag, value)
      __return_value = LibGst.preset_get_meta(@pointer.as(LibGst::Preset*), name.to_unsafe, tag.to_unsafe, value)
      __return_value
    end

    def preset_names
      __return_value = LibGst.preset_get_preset_names(@pointer.as(LibGst::Preset*))
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) }
    end

    def property_names
      __return_value = LibGst.preset_get_property_names(@pointer.as(LibGst::Preset*))
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) }
    end

    def editable?
      __return_value = LibGst.preset_is_editable(@pointer.as(LibGst::Preset*))
      __return_value
    end

    def load_preset(name)
      __return_value = LibGst.preset_load_preset(@pointer.as(LibGst::Preset*), name.to_unsafe)
      __return_value
    end

    def rename_preset(old_name, new_name)
      __return_value = LibGst.preset_rename_preset(@pointer.as(LibGst::Preset*), old_name.to_unsafe, new_name.to_unsafe)
      __return_value
    end

    def save_preset(name)
      __return_value = LibGst.preset_save_preset(@pointer.as(LibGst::Preset*), name.to_unsafe)
      __return_value
    end

    def set_meta(name, tag, value)
      __return_value = LibGst.preset_set_meta(@pointer.as(LibGst::Preset*), name.to_unsafe, tag.to_unsafe, value ? value.to_unsafe : nil)
      __return_value
    end

  end
end

