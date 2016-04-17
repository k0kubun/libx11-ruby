module LibX11
  module Xlib
    class XFontSetExtents < FFI::Struct
      layout(
        :max_ink_extent,     XRectangle,
        :max_logical_extent, XRectangle,
      )
    end
  end
end
