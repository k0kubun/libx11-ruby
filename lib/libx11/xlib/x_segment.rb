module LibX11
  module Xlib
    class XSegment < FFI::Struct
      layout(
        :x1, :short,
        :y1, :short,
        :x2, :short,
        :y2, :short,
      )
    end
  end
end
