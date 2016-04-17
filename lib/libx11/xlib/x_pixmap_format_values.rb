module LibX11
  module Xlib
    class XPixmapFormatValues < FFI::Struct
      layout(
        :depth,          :int,
        :bits_per_pixel, :int,
        :scanline_pad,   :int,
      )
    end
  end
end
