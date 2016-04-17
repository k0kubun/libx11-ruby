module LibX11
  module Xlib
    class XIMStyles < FFI::Struct
      layout(
        :count_styles,     :ushort,
        :supported_styles, XIMStyle.ptr,
      )
    end
  end
end
