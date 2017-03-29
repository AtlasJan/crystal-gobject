module Gst
  module TagSetter
    def add_tag_value(mode : Gst::TagMergeMode, tag, value)
      __return_value = LibGst.tag_setter_add_tag_value(to_unsafe.as(LibGst::TagSetter*), mode, tag.to_unsafe, value.to_unsafe.as(LibGObject::Value*))
      __return_value
    end

    def tag_list
      __return_value = LibGst.tag_setter_get_tag_list(to_unsafe.as(LibGst::TagSetter*))
      Gst::TagList.new(__return_value) if __return_value
    end

    def tag_merge_mode
      __return_value = LibGst.tag_setter_get_tag_merge_mode(to_unsafe.as(LibGst::TagSetter*))
      __return_value
    end

    def merge_tags(list, mode : Gst::TagMergeMode)
      __return_value = LibGst.tag_setter_merge_tags(to_unsafe.as(LibGst::TagSetter*), list.to_unsafe.as(LibGst::TagList*), mode)
      __return_value
    end

    def reset_tags
      __return_value = LibGst.tag_setter_reset_tags(to_unsafe.as(LibGst::TagSetter*))
      __return_value
    end

    def tag_merge_mode=(mode : Gst::TagMergeMode)
      __return_value = LibGst.tag_setter_set_tag_merge_mode(to_unsafe.as(LibGst::TagSetter*), mode)
      __return_value
    end

  end
end

