module LibX11
  module Xlib
    class XwcTextItem < FFI::Struct
      layout(
        :chars,    :pointer,
        :nchars,   :int,
        :delta,    :int,
        :font_set, :pointer,
      )
    end
  end
end
