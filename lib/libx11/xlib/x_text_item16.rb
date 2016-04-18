module LibX11
  module Xlib
    class XTextItem16 < FFI::Struct
      layout(
        :chars,  XChar2b.ptr,
        :nchars, :int,
        :delta,  :int,
        :font,   :Font,
      )
    end
  end
end
