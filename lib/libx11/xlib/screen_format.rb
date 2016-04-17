module LibX11
  module Xlib
    class ScreenFormat < FFI::Struct
      layout(
        :ext_data,       :pointer,
        :depth,          :int,
        :bits_per_pixel, :int,
        :scanline_pad,   :int,
      )
    end
  end
end
