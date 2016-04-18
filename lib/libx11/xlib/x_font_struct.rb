module LibX11
  module Xlib
    class XFontStruct < FFI::Struct
      layout(
        :ext_data,          :pointer,
        :fid,               :Font,
        :direction,         :uchar,
        :min_char_or_byte2, :uchar,
        :max_char_or_byte2, :uchar,
        :min_byte1,         :uchar,
        :max_byte1,         :uchar,
        :all_chars_exist,   :bool,
        :default_char,      :uchar,
        :n_properties,      :int,
        :properties,        XFontProp.ptr,
        :min_bounds,        XCharStruct,
        :max_bounds,        XCharStruct,
        :per_char,          XCharStruct.ptr,
        :ascent,            :int,
        :descent,           :int,
      )
    end
  end
end
