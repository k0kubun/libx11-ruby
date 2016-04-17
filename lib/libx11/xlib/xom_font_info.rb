module LibX11
  module Xlib
    class XOMFontInfo < FFI::Struct
      layout(
        :num_font,         :int,
        :font_struct_list, :pointer,
        :font_name_list,   :pointer,
      )
    end
  end
end
