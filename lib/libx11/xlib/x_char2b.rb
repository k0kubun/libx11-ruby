module LibX11
  module Xlib
    class XChar2b < FFI::Struct
      layout(
        :byte1, :uchar,
        :byte2, :uchar,
      )
    end
  end
end
