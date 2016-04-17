module LibX11
  module Xlib
    class XTextItem16 < FFI::Struct
      layout(
        :chars,  :pointer,
        :nchars, :int,
        :delta,  :int,
        :font,   :Font,
      )
    end
  end
end
